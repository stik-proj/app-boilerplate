import 'package:app_boilerplate/platform/firebase/cloud_messaging.dart';
import 'package:app_boilerplate/platform/firebase/crashlytics.dart';
import 'package:app_boilerplate/platform/firebase/dynamic_link.dart';
import 'package:app_boilerplate/platform/firebase/firebase_options.dart';
import 'package:app_boilerplate/platform/firebase/remote_config.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> initFirebasePackages() async {
  await initDynamicLink();
  await initCrashlytics();
  await initRemoteConfig();
  await initFcm();
}
