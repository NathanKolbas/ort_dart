import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:github/github.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

import 'environment.dart';
import 'options.dart';

final _log = Logger('builder');

/// Setup precompiled ONNX Runtime binaries.
class OrtBinaries {
  static const yamlFileName = 'ort_dist.yaml';
  static final RepositorySlug ortBinariesSlug = RepositorySlug('NathanKolbas', 'dart-ort-artifacts');
  static final String binariesOutputPath = path.join(Environment.manifestDir, 'ort_binaries');

  OrtBinaries._();

  /// Downloads prebuilt ONNX Runtime binaries for specific platform. Returns
  /// path to downloaded binaries for particular [rustTarget].
  static Future<String?> setup({
    required String rustTarget,
    bool release = true,
  }) async {
    // TODO: Windows builds are broken and need fixed: https://github.com/NathanKolbas/ort_dart/issues/1
    if (rustTarget.contains('windows')) {
      return null;
    }

    final binariesDist = OrtBinariesYaml.load();
    if (binariesDist == null) return null;

    // Append debug or release to rust target
    rustTarget += release ? '-release' : '-debug';

    final github = GitHub();
    final repo = github.repositories;
    final githubRelease = await repo.getReleaseByTagName(ortBinariesSlug, binariesDist.releaseTag);
    final assets = githubRelease.assets ?? [];
    final assetsArchiveMap = Map.fromEntries(assets.map((asset) => MapEntry(asset.name, asset)));

    final target = binariesDist.rustTargets[rustTarget];
    if (target == null) {
      _log.warning("$yamlFileName missing precompiled binaries for rust target $rustTarget. Ignoring...");
      return null;
    }

    final asset = assetsArchiveMap[target.archive];
    final downloadUrl = asset?.browserDownloadUrl;
    if (asset == null || downloadUrl == null) {
      _log.warning("GitHub release ${githubRelease.url} missing precompiled binaries for rust target $rustTarget. Ignoring...");
      return null;
    }

    return await _tryDownloadArtifacts(
      rustTarget: rustTarget,
      ortTarget: target,
      asset: asset,
      downloadUrl: downloadUrl,
    );
  }

  static Future<Response> _get(Uri url, {Map<String, String>? headers}) async {
    int attempt = 0;
    const maxAttempts = 10;
    while (true) {
      try {
        return await get(url, headers: headers);
      } on SocketException catch (e) {
        // Try to detect reset by peer error and retry.
        if (attempt++ < maxAttempts && (e.osError?.errorCode == 54 || e.osError?.errorCode == 10054)) {
          _log.severe('Failed to download $url: $e, attempt $attempt of $maxAttempts, will retry...');
          await Future.delayed(Duration(seconds: 1));
          continue;
        } else {
          rethrow;
        }
      }
    }
  }

  static Future<String?> _tryDownloadArtifacts({
    required String rustTarget,
    required OrtBinariesYamlTarget ortTarget,
    required ReleaseAsset asset,
    required String downloadUrl,
  }) async {
    final outputPath = path.join(binariesOutputPath, rustTarget);
    final ortLibLocation = path.join(outputPath, path.dirname(ortTarget.ortLib));
    final sig = path.join(outputPath, '.sig');

    if (Directory(outputPath).existsSync()) {
      if (File(sig).existsSync()) {
        final currentSig = File(sig).readAsStringSync();
        if (currentSig == ortTarget.sha256) {
          _log.fine('Binary sigs match, using previously downloaded binaries');
          return ortLibLocation;
        }
      }

      _log.fine('Binary sigs differ, removing old binaries');
      Directory(outputPath).deleteSync(recursive: true);
    }

    final url = Uri.parse(downloadUrl);
    _log.fine('Downloading ONNX Runtime binary from $url');
    final res = await _get(url);
    if (res.statusCode != 200) {
      _log.severe('Failed to download binary $url: status ${res.statusCode}');
      return null;
    }
    if (_verifySha256(res.bodyBytes, ortTarget.sha256)) {
      final archive = ZipDecoder().decodeBytes(res.bodyBytes);
      await extractArchiveToDiskAsync(archive, outputPath);
      await File(sig).writeAsString(ortTarget.sha256);
      return ortLibLocation;
    } else {
      _log.shout('Signature verification failed! Ignoring binary.');
    }

    return null;
  }

  static bool _verifySha256(Uint8List input, String expectedHash) {
    return sha256.convert(input).toString() == expectedHash;
  }
}

class OrtBinariesYaml {
  final String releaseTag;
  final String onnxruntimeRef;
  final Map<String, OrtBinariesYamlTarget> rustTargets;

  OrtBinariesYaml({
    required this.releaseTag,
    required this.onnxruntimeRef,
    required this.rustTargets,
  });

  static OrtBinariesYaml? load() {
    final manifestDir = Environment.manifestDir;
    final uri = Uri.file(path.join(manifestDir, OrtBinaries.yamlFileName));
    final file = File.fromUri(uri);
    if (file.existsSync()) {
      final contents = loadYamlNode(file.readAsStringSync(), sourceUrl: uri);
      return parse(contents);
    } else {
      _log.warning("File $uri missing.\nUnable to determine where to get ONNX Runtime binaries. Ignoring...");
      return null;
    }
  }

  static OrtBinariesYaml parse(YamlNode node) {
    if (node is! YamlMap) {
      throw SourceSpanException('${OrtBinaries.yamlFileName} options must be a map', node.span);
    }

    final Map<String, OrtBinariesYamlTarget> rustTargets = {};
    String? releaseTag;
    String? onnxruntimeRef;

    for (final entry in node.nodes.entries) {
      if (entry case MapEntry(
        key: YamlScalar(value: 'rust_targets'),
        value: YamlNode node,
      )) {
        if (node is! YamlMap) {
          throw SourceSpanException('${OrtBinaries.yamlFileName} "rust_targets" must be a map of rust targets to metadata', node.span);
        }

        for (final MapEntry(key: YamlScalar targetName, value: YamlNode targetInfo) in node.nodes.entries) {
          rustTargets[targetName.value] = OrtBinariesYamlTarget.parse(targetInfo);
        }
      } else if (entry case MapEntry(
        key: YamlScalar(value: 'onnxruntime_ref'),
        value: YamlScalar node,
      )) {
        onnxruntimeRef = node.value;
      } else if (entry case MapEntry(
        key: YamlScalar(value: 'release_tag'),
        value: YamlScalar node,
      )) {
        releaseTag = node.value;
      } else {
        throw SourceSpanException('Unknown cargokit option type. Must be "rust_targets" or "release_tag".', entry.key.span);
      }
    }

    if (releaseTag == null) {
      throw StateError('${OrtBinaries.yamlFileName} must contain "release_tag"');
    }
    if (onnxruntimeRef == null) {
      throw StateError('${OrtBinaries.yamlFileName} must contain "onnxruntime_ref"');
    }

    return OrtBinariesYaml(
      releaseTag: releaseTag,
      rustTargets: rustTargets,
      onnxruntimeRef: onnxruntimeRef,
    );
  }

  @override
  String toString() => 'release_tag: $releaseTag\n'
      'rust_targets:\n'
      '${rustTargets.entries.map((e) => '\t- ${e.key}: ${e.value}').join('\n')}';
}

class OrtBinariesYamlTarget {
  final String archive;
  final String sha256;
  final String ortLib;
  final List<String> extraFiles;

  OrtBinariesYamlTarget({
    required this.archive,
    required this.sha256,
    required this.ortLib,
    required this.extraFiles,
  });

  static OrtBinariesYamlTarget parse(YamlNode node) {
    if (node is! YamlMap) {
      throw SourceSpanException("${OrtBinaries.yamlFileName} a rust_target's info must be a map", node.span);
    }

    late String archive;
    late String sha256;
    late String ortLib;
    late List<String> extraFiles;

    for (final entry in node.nodes.entries) {
      if (entry.key case YamlScalar(value: 'archive')) {
        archive = (entry.value as YamlScalar).value;
      } else if (entry.key case YamlScalar(value: 'sha256')) {
        sha256 = (entry.value as YamlScalar).value;
      } else if (entry.key case YamlScalar(value: 'ort_lib')) {
        ortLib = (entry.value as YamlScalar).value;
      } else if (entry.key case YamlScalar(value: 'extra_files')) {
        extraFiles = (entry.value as YamlList).nodes.map((e) => e.value as String).toList();
      } else {
        throw SourceSpanException(
          'Unknown OrtBinariesTarget info. Must be "archive", "sha256", "ort_lib", or "extra_files".',
          entry.key.span,
        );
      }
    }

    return OrtBinariesYamlTarget(
      archive: archive,
      sha256: sha256,
      ortLib: ortLib,
      extraFiles: extraFiles,
    );
  }

  @override
  String toString() => 'OrtBinariesTarget(archive: $archive, sha256: $sha256, '
      'ortLib: $ortLib, extraFiles: $extraFiles)';
}
