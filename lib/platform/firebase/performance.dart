import 'package:firebase_performance/firebase_performance.dart';

void traceCodePerformance({required String traceName, required traceTargetCode}) async {
  Trace customTrace = FirebasePerformance.instance.newTrace(traceName);
  await customTrace.start();

  traceTargetCode();

  await customTrace.stop();
}
