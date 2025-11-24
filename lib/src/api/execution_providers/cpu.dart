import 'package:ort/src/api/execution_providers/execution_providers.dart';
import 'package:ort/src/rust/api/execution_providers/cpu.dart' as cpu;
import 'package:ort/src/rust/api/execution_providers.dart' as ort_ep;

/// The default CPU execution provider, powered by MLAS.
class CPUExecutionProvider extends cpu.CPUExecutionProvider implements ExecutionProvider {
  CPUExecutionProvider() : super.raw();

  @override
  ort_ep.ExecutionProvider toImpl() => ort_ep.ExecutionProvider.cpu(this);
}
