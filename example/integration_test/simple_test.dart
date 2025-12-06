import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ort/ort.dart';
import 'package:ort_example/main.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await Ort.ensureInitialized(throwOnFail: true);

  group('Tensor', () {
    test('fromArrayF32', () {
      final tensor = Tensor.fromArrayF32(data: [1, 2, 3]);
      expect(tensor.dtype, TensorElementType.float32);
    });

    group('fromArray', () {
      test('f32', () {
        final tensor = Tensor.fromArray(
          dtype: TensorElementType.float32,
          data: [1.0, 2.0, 3.0],
        );
        expect(tensor.dtype, TensorElementType.float32);
      });
    });

    test('shape', () {
      Tensor tensor = Tensor.fromArray(dtype: TensorElementType.int32, data: [1]);
      expect(tensor.shape, [1]);

      tensor = Tensor.fromArray(
          dtype: TensorElementType.int32,
          data: [
            1, 2, 3, 4,
            1, 2, 3, 4,
          ],
          shape: [2, 4]
      );
      expect(tensor.shape, [2, 4]);
    });

    test('length', () {
      Tensor tensor = Tensor.fromArray(dtype: TensorElementType.int32, data: [1]);
      expect(tensor.data.length, 1);

      tensor = Tensor.fromArray(
        dtype: TensorElementType.int32,
        data: [
          1, 2, 3, 4,
          1, 2, 3, 4,
        ],
        shape: [2, 4]
      );
      expect(tensor.data.length, 8);
    });

    test('data', () {
      final data = [1, 2, 3, 4];
      final tensor = Tensor.fromArrayI32(data: data);
      expect(tensor.data, data);
    });

    test('operator []', () {
      final tensor = Tensor.fromArrayI32(data: [1, 2, 3, 4]);
      expect(tensor.data[1], 2);
    });

    test('operator []=', () {
      final tensor = Tensor.fromArrayI32(data: [1, 2, 3, 4]);
      expect(tensor.data[1], 2);

      tensor.data[1] = 42;
      expect(tensor.data[1], 42);
    });

    test('iterator', () {
      final tensor = Tensor.fromArrayI32(data: [1, 2, 3, 4]);

      for (int i = 0; i < tensor.data.length; i++) {
        tensor.data[i] *= 10;
      }

      expect(tensor.data, [10, 20, 30, 40]);
    });

    test('can not grow the Tensor', () {
      final tensor = Tensor.fromArrayI32(data: [1, 2, 3, 4]);
      expect(
        () {
          tensor.data.add(0);
        },
        throwsA(predicate((e) => e is UnsupportedError
            && e.message == 'Cannot add to a fixed-length list'
        )),
      );
    });
  });

  group('Session', () {
    test('can run session', () async {
      const List<double> vec = [1, 2, 3];
      final tensorA = Tensor.fromArrayF32(data: vec);
      final tensorB = Tensor.fromArrayF32(data: vec);

      expect(tensorA.data[1], vec[1]);

      tensorA.data[1] = 42.0;

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
      expect(output['c']?.data, [94.0]);
    });
  });
}
