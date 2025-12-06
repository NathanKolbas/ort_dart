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

    test("rust keeps Tensor in memory after running inference", () async {
      const List<double> vec = [1, 2, 3];
      final tensorA = Tensor.fromArrayF32(data: vec);
      final tensorB = Tensor.fromArrayF32(data: vec);

      final session = await Session.builder()
        .withExecutionProviders([
          CUDAExecutionProvider(),
          CPUExecutionProvider(),
        ])
        .commitFromMemory(matmulModel);

      final output = await session.run(inputValues: {
        'a': tensorA,
        'b': tensorB,
      });

      expect(output.length, 1);
      // Should not get this error:
      // DroppableDisposedException: Try to use `RustArc<dynamic>` after it has been disposed
      expect(tensorA.data, vec);
    });
  });
}
