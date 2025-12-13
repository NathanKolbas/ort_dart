# Drt ONNX Runtime (ort)

Enabling cross-platform ONNX Runtime (ORT) in Flutter powered by Rust.

Under-the-hood this library uses the amazing rust [ort](https://ort.pyke.io/) library by [pyke](https://pyke.io/). Then
[flutter_rust_bridge](https://cjycode.com/flutter_rust_bridge/) is used to help make this communication easier.

## ONNX Runtime binaries

> ⚠️ There are currently issues with some precompiled binaries. ⚠️
> 
> Windows (workaround - using pyke's binaries) - https://github.com/NathanKolbas/ort_dart/issues/1 \
> MacOS (workaround - using pyke's binaries) - https://github.com/NathanKolbas/ort_dart/issues/4 \
> iOS (failing) - https://github.com/NathanKolbas/ort_dart/issues/5

Prebuilt binaries are available for all platforms and can be found at [dart-ort-artifacts](https://github.com/NathanKolbas/dart-ort-artifacts).
They are downloaded during compile when creating the binaries for this library.

> 🗒️ You typically do not need to worry about this since we create binaries for this library that statically link the 
> onnxruntime.

You are more than welcome to use your own binaries. Simply set the `ORT_LIB_LOCATION` environment variable to the
location of your own static-binaries.

## Execution Providers

Execution providers depend on the platform and which were compiled. Each platform has certain execution providers 
compiled by default.

You can find more information here: [dart-ort-artifacts](https://github.com/NathanKolbas/dart-ort-artifacts).

> 🗒️ If you would like specific execution providers to be built-in by default feel free to make an issue so this can be discussed more!

Here is a matrix breakdown:

[//]: # (https://onnxruntime.ai/docs/build/eps.html)
[//]: # (CUDA, TensorRT, oneDNN, OpenVINO, QNN, DirectML, ACL, ANN, RKNPU, AMD Vitis AI, AMD MIGraphX, NNAPI, CoreML, XNNPACK, CANN, Azure)

| Platform | Execution Providers                       |
|----------|-------------------------------------------|
| Android  | NNAPI, XNNPACK                            |
| iOS      | CoreML, XNNPACK                           |
| Linux    | OpenVINO, XNNPACK                         |
| MacOS    | CoreML, XNNPACK                           |
| WASM     | WebGPU                                    |
| Windows  | DirectML, OpenVINO (x86_64 only), XNNPACK |

If an execution provider is not available we fall back to CPU (this is how pyke's ort rust library works).

## Platform Breakdown

You can find more information about each platform below.

### Android

The minimum SDK is 28. While you can go lower, this is best for performance.

### iOS

The minimum iOS version is 15. While you can go lower, this is best for performance.

### Linux

glibc ≥ 2.35 & libstdc++ >= 12 (Ubuntu ≥ 22.04, Debian ≥ 12 ‘Bookworm’)

### MacOS

MacOS 13.3 or greater.

### WASM

Comes bundled with the WebGPU execution provider.

### Windows

> ⚠️ ARM Support is disabled for the time being until build can be fixed.

Supports Windows 10 and 11.

OpenVINO does not have builds for arm64. npm distribution states "Windows ARM is not supported".

## Setup

Once you have added the library

```shell
flutter pub add ort
```

> 🗒️ `flutter` is used in the command until Dart's Code Assets is working then you can use dart/flutter.

Initialize the ort with:

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Ort.ensureInitialized();
  
  // ...
}
```

`Ort.ensureInitialized` providers several options for initialization, such as `throwOnFail`, so don't forget to check it
out!

## Usage

Some common info and usage of this library.

```dart
const matmulModel = [
  8, 9, 18, 0, 58, 55, 10, 17, 10, 1, 97, 10, 1, 98, 18, 1, 99, 34, 6, 77, 97,
  116, 77, 117, 108, 18, 1, 114, 90, 9, 10, 1, 97, 18, 4, 10, 2, 8, 1, 90, 9,
  10, 1, 98, 18, 4, 10, 2, 8, 1, 98, 9, 10, 1, 99, 18, 4, 10, 2, 8, 1, 66, 2,
  16, 20
];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Ort.ensureInitialized();

  const List<double> vec = [1, 2, 3];
  final tensorA = Tensor.fromArrayF32(data: vec);
  final tensorB = Tensor.fromArrayF32(data: vec);

  // You can directly modify the Tensor's data from dart!
  tensorA.data[1] = 42.0;

  // You can load a ONNX model from memory!
  final session = await Session.builder().commitFromMemory(matmulModel);

  // output is Map<String, Tensor<dynamic>>
  final output = await session.run(inputValues: {
    'a': tensorA,
    'b': tensorB,
  });
  
  print(output['c']?.data);
  // [94.0]
}
```

### Tensor

The most commonly used is the `Tesnor` class. Some tricks to know is that the `data` field in the `Tensor` class under 
the hood points to the same location as the `Tensor`'s memory. While it appears as a `List<T>` on the dart side making 
it super easy to work with, you can directly modify the Tensor from dart! As long as the `Tensor` resides in CPU 
accessible memory of course :)

### Session

You can load an ONNX model from both memory (`Session.builder().commitFromMemory`) and file 
(`Session.builder().commitFromFile`).

A quirk to be aware of if you are trying to get the maximal amount of performance:

When `Session` `run` is used the`Tensor` is dropped. This is because Rust ends up dropping it from memory when passed 
from dart to rust. To "fix" this in the meantime (more like a workaround) we clone the `Tensor` on the Dart side before 
passing it to Rust. You can disable this behavior by setting `doNotClone` in `run` to true.

So while you don't need to worry about this since by default the `Tensor` is cloned it might be helpful to you due to
performance (while negligible). An issue tracking this is here: https://github.com/NathanKolbas/ort_dart/issues/2.

## License

To keep in the spirit of [ort](https://github.com/pykeio/ort), this library is dual licensed under Apache-2.0 and/or MIT.
