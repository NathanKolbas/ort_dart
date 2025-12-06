import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ort/ort.dart';
import 'package:ort_example/main.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Ort.ensureInitialized(throwOnFail: true);

  group('Tensor', () {
    test('handles type-cast from int to double', () {
      const data = [10, 20, 30, 40, 50];
      final tensor = Tensor.fromArray<double>(
        dtype: TensorElementType.float32,
        data: data,
      );
      expect(tensor.data, data);

      tensor.data[0] = 1;
      expect(tensor.data, [1, 20, 30, 40, 50]);
    });

    group('get and modify Tensor data', () {
      const List<double> floatList = [1, 2, 3, 4, 5];
      for (final type in [
        TensorElementType.float64,
        TensorElementType.float32,
        TensorElementType.float16,
      ]) {
        test(type.name, () {
          final tensor = Tensor.fromArray<double>(
            dtype: type,
            data: floatList,
          );
          expect(tensor.data, floatList);

          tensor.data[0] = 42;
          expect(tensor.data, [42, ...floatList.sublist(1)]);
          expect(tensor.data, tensor.extractTensor());
        });
      }

      const List<int> intList = [1, 2, 3, 4, 5];
      for (final type in [
        TensorElementType.int64,
        TensorElementType.int32,
        TensorElementType.int16,
        TensorElementType.int8,

        TensorElementType.uint64,
        TensorElementType.uint32,
        TensorElementType.uint16,
        TensorElementType.uint8,
      ]) {
        test(type.name, () {
          final tensor = Tensor.fromArray<int>(
            dtype: type,
            data: floatList,
          );
          expect(tensor.data, intList);

          tensor.data[0] = 42;
          expect(tensor.data, [42, ...intList.sublist(1)]);
          expect(tensor.data, tensor.extractTensor());
        });
      }

      const List<String> stringList = ['foo', 'bar', 'baz', 'qux', 'quux'];
      test('String', () {
        final tensor = Tensor.fromArray<String>(
          dtype: TensorElementType.string,
          data: stringList,
        );
        expect(tensor.data, stringList);

        tensor.data[0] = '42';
        expect(tensor.data, ['42', ...stringList.sublist(1)]);
        expect(tensor.data, tensor.extractTensor());
      });

      const List<bool> boolList = [true, false, true, false, true];
      test('bool', () {
        final tensor = Tensor.fromArray<bool>(
          dtype: TensorElementType.bool,
          data: boolList,
        );
        expect(tensor.data, boolList);

        tensor.data[0] = !boolList[0];
        expect(tensor.data, [!boolList[0], ...boolList.sublist(1)]);
        expect(tensor.data, tensor.extractTensor());
      });
    });

    test('extracting tensor multiple times returns the same data', () {
      const data = [10, 20, 30, 40, 50];
      final tensor = Tensor.fromArray<double>(
        dtype: TensorElementType.float32,
        data: data,
      );
      expect(tensor.data, data);

      expect(tensor.data, tensor.extractTensor());
      expect(tensor.data, tensor.extractTensor());

      expect(data, tensor.extractTensor());
      expect(data, tensor.extractTensor());
    });

    group('memoryInfo', () {
      final tensor = Tensor.fromArray<double>(
        dtype: TensorElementType.float32,
        data: [10, 20, 30, 40, 50],
      );
      final memoryInfo = tensor.memoryInfo();

      test('allocationDevice', () {
        expect(memoryInfo.allocationDevice(), AllocationDevice.cpu());
      });

      test('allocatorType', () {
        expect(memoryInfo.allocatorType(), AllocatorType.device);
      });

      test('deviceId', () {
        expect(memoryInfo.deviceId(), 0);
      });

      test('deviceType', () {
        expect(memoryInfo.deviceType(), DeviceType.cpu);
      });

      test('isCpuAccessible', () {
        expect(memoryInfo.isCpuAccessible(), true);
      });

      test('memoryType', () {
        expect(memoryInfo.memoryType(), MemoryType.default_);
      });
    });

    // Copy is no longer implemented due to very strange unknown bugs such as:
    //
    // package:flutter_rust_bridge/src/codec/base.dart 32:9                                                         SimpleDecoder.decode
    // package:flutter_rust_bridge/src/codec/sse.dart 45:55                                                         SseCodec._decode
    // package:flutter_rust_bridge/src/codec/sse.dart 40:7                                                          SseCodec.decodeWireSyncType
    // package:flutter_rust_bridge/src/main_components/handler.dart 34:25                                           BaseHandler.executeSync
    // package:ort/src/rust/frb_generated.dart 1552:20                                                              RustLibApiImpl.crateApiTensorTensorImplGetDataF32Pointer
    // package:ort/src/rust/frb_generated.dart 7598:8                                                               TensorImplImpl.getDataF32Pointer
    // package:ort/src/api/tensor.dart 265:44                                                                       Tensor.extractTensor
    // package:ort/src/api/tensor.dart 407:12                                                                       Tensor.data
    // integration_test\tensor_test.dart 157:22                                                                     main.<fn>.<fn>
    // ===== asynchronous gap ===========================
    // package:stream_channel                                                                                       _GuaranteeSink.add
    // Temp/flutter_tools.664d7c8f/flutter_test_listener.ac40181f/listener.dart 56:22  main.<fn>
    //
    // AnyhowException(Unsuported type proto value case.)
    //
    // Original rust implementation:
    // /// Creates a copy of this tensor but pointing to the same data.
    // #[frb(sync)]
    // pub fn copy(&mut self) -> TensorImpl {
    //  Self {
    //    tensor: unsafe { DynTensor::from_ptr(NonNull::new_unchecked(self.tensor.ptr_mut()), None) },
    //    mutable: self.mutable,
    //  }
    // }
    //
    // test("copy points to the same data", () async {
    //   const List<double> vec = [1, 2, 3];
    //   final tensor = Tensor.fromArrayF32(data: vec);
    //   final copy = tensor.copy();
    //
    //   expect(tensor.data, copy.data);
    //
    //   tensor.data[0] = 4;
    //   copy.data[2] = 5;
    //
    //   expect(tensor.data, copy.data);
    //
    //   // Disposing the copy shouldn't dispose the underlying data
    //   copy.dispose();
    //   expect(tensor.data, [4, 2, 5]);
    // });

    test("rust keeps Tensor in memory after running inference", () async {
      const List<double> vec = [1, 2, 3];
      final tensorA = Tensor.fromArrayF32(data: vec);
      final tensorB = Tensor.fromArrayF32(data: vec);

      Session session = await Session.builder().commitFromMemory(matmulModel);
      Map<String, Tensor> output = await session.run(inputValues: {
        'a': tensorA,
        'b': tensorB,
      });

      expect(output['c']?.data, [14.0]);

      // Should not get this error:
      // DroppableDisposedException: Try to use `RustArc<dynamic>` after it has been disposed
      expect(tensorA.data, vec);

      // Should be able to run inference twice

      session = await Session.builder().commitFromMemory(matmulModel);
      output = await session.run(inputValues: {
        'a': tensorA,
        'b': tensorB,
      });

      expect(output['c']?.data, [14.0]);

      // Should not get this error:
      // DroppableDisposedException: Try to use `RustArc<dynamic>` after it has been disposed
      expect(tensorA.data, vec);
    });
  });
}
