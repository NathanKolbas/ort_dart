import 'dart:math' as math;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ort/ort.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async => await Ort.ensureInitialized());

  group('Tensor', () {
    test('handles type-cast from int to double', () async {
      const data = [10, 20, 30, 40, 50];
      final tensor = await Tensor.fromArray<double>(
        dtype: TensorElementType.float32,
        data: data,
      );
      expect(tensor.data, data);

      tensor[0] = 1;
      expect(tensor.data, [1, 20, 30, 40, 50]);
    });

    double tensorIterationSum = 0;
    double nativeIterationSum = 0;
    double tensorIterationFromGettingDataSum = 0;
    double arrayPointerIterationSum = 0;

    test('iteration speed test', () async {
      final rand = math.Random(42);
      final data = List.filled(1_000_000, rand.nextDouble());
      final tensor = Tensor.fromArray<double>(
        dtype: TensorElementType.float32,
        data: data,
      );

      Stopwatch stopwatch = Stopwatch()..start();
      for (final e in tensor) {
        tensorIterationSum += e;
      }
      stopwatch.stop();
      final tensorIterationElapsed = stopwatch.elapsed;

      stopwatch = Stopwatch()..start();
      for (final e in data) {
        nativeIterationSum += e;
      }
      stopwatch.stop();
      final nativeIterationElapsed = stopwatch.elapsed;

      stopwatch = Stopwatch()..start();
      tensor.data;
      stopwatch.stop();
      final timeToGetTensorData = stopwatch.elapsed;

      stopwatch = Stopwatch()..start();
      for (final e in tensor.data) {
        tensorIterationFromGettingDataSum += e;
      }
      stopwatch.stop();
      final tensorIterationFromGettingDataElapsed = stopwatch.elapsed;

      stopwatch = Stopwatch()..start();
      List<double>.from(tensor.data);
      stopwatch.stop();
      final listFromTime = stopwatch.elapsed;

      stopwatch = Stopwatch()..start();
      final dataPointer = tensor.dataPointer;
      stopwatch.stop();
      final loadingArrayPointerTime = stopwatch.elapsed;

      stopwatch = Stopwatch()..start();
      for (final e in dataPointer) {
        arrayPointerIterationSum += e;
      }
      stopwatch.stop();
      final arrayPointerIterationTime = stopwatch.elapsed;

      print(dataPointer[0]);
      dataPointer[0] = 1.0;
      print(dataPointer[0]);
      print(tensor[0]);

      // Can free the memory
      // tensor.dispose();

      print('tensorIterationElapsed = $tensorIterationElapsed');
      print('nativeIterationElapsed = $nativeIterationElapsed');
      print('timeToGetTensorData = $timeToGetTensorData');
      print('tensorIterationFromGettingDataElapsed = $tensorIterationFromGettingDataElapsed');
      print('listFromTime = $listFromTime');
      print('loadingArrayPointerTime = $loadingArrayPointerTime');
      print('arrayPointerIterationTime = $arrayPointerIterationTime');

      // There might be a slight variance in the float/double value which is acceptable.
      final expectedSum = closeTo(150925.45747756958, 0.01);

      expect(tensorIterationSum, expectedSum);
      expect(nativeIterationSum, expectedSum);
      expect(tensorIterationFromGettingDataSum, expectedSum);
      expect(arrayPointerIterationSum, expectedSum);

      expect(tensorIterationElapsed, greaterThan(nativeIterationElapsed));
    });
  });
}
