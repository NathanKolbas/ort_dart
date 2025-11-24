import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ort/ort.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await Ort.ensureInitialized());

  group('Tensor', () {
    test('fromArrayF32', () async {
      final tensor = await Tensor.fromArrayF32(data: [1, 2, 3]);
      expect(tensor.dtype, TensorElementType.float32);
    });

    group('fromArray', () {
      test('f32', () async {
        final tensor = await Tensor.fromArray(
          dtype: TensorElementType.float32,
          data: [1.0, 2.0, 3.0],
        );
        expect(tensor.dtype, TensorElementType.float32);
      });
    });

    test('shape', () async {
      Tensor tensor = await Tensor.fromArray(dtype: TensorElementType.int32, data: [1]);
      expect(tensor.shape, [1]);

      tensor = await Tensor.fromArray(
          dtype: TensorElementType.int32,
          data: [
            1, 2, 3, 4,
            1, 2, 3, 4,
          ],
          shape: [2, 4]
      );
      expect(tensor.shape, [2, 4]);
    });

    test('length', () async {
      Tensor tensor = await Tensor.fromArray(dtype: TensorElementType.int32, data: [1]);
      expect(tensor.length, 1);

      tensor = await Tensor.fromArray(
        dtype: TensorElementType.int32,
        data: [
          1, 2, 3, 4,
          1, 2, 3, 4,
        ],
        shape: [2, 4]
      );
      expect(tensor.length, 8);
    });

    test('data', () async {
      final data = [1, 2, 3, 4];
      final tensor = await Tensor.fromArrayI32(data: data);
      expect(tensor.data, data);
    });

    test('operator []', () async {
      final tensor = await Tensor.fromArrayI32(data: [1, 2, 3, 4]);
      expect(tensor[1], 2);
    });

    test('operator []=', () async {
      final tensor = await Tensor.fromArrayI32(data: [1, 2, 3, 4]);
      expect(tensor[1], 2);

      tensor[1] = 42;
      expect(tensor[1], 42);
    });

    test('iterator', () async {
      final tensor = await Tensor.fromArrayI32(data: [1, 2, 3, 4]);

      for (int i = 0; i < tensor.length; i++) {
        tensor[i] *= 10;
      }

      expect(tensor.data, [10, 20, 30, 40]);
    });

    test('can not grow the Tensor', () async {
      final tensor = await Tensor.fromArrayI32(data: [1, 2, 3, 4]);
      expect(() => tensor.add(0), throwsA(predicate((e) => e is StateError && e.message == 'Tensor is not growable')));
    });
  });

  group('Session', () {
    test('can run session', () async {
      const matmulModel = [
        8, 9, 18, 0, 58, 55, 10, 17, 10, 1, 97, 10, 1, 98, 18, 1, 99, 34, 6, 77,
        97, 116, 77, 117, 108, 18, 1, 114, 90, 9, 10, 1, 97, 18, 4, 10, 2, 8, 1,
        90, 9, 10, 1, 98, 18, 4, 10, 2, 8, 1, 98, 9, 10, 1, 99, 18, 4, 10, 2, 8,
        1, 66, 2, 16, 20
      ];

      const List<double> vec = [1, 2, 3];
      final tensorA = await Tensor.fromArrayF32(data: vec);
      final tensorB = await Tensor.fromArrayF32(data: vec);

      expect(tensorA[1], vec[1]);

      tensorA[1] = 42.0;

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
