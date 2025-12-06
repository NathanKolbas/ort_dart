import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ort/ort.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Ort.ensureInitialized(throwOnFail: true);

  group('ExecutionProviders', () {
    test('getAvailableExecutionProviders', () {
      final availableExecutionProviders = getAvailableExecutionProviders();
      // Should always have the CPU execution provider.
      expect(availableExecutionProviders, hasLength(greaterThanOrEqualTo(1)));
      expect(availableExecutionProviders.any((ep) => ep is CPUExecutionProvider), isTrue);
    });
  });
}
