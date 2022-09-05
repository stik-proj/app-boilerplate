import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

Future<void> initCrashlytics() async {
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
}

void recordCrashlyticsError(error, stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
}
