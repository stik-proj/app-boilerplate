import 'dart:async';

import 'package:app_boilerplate/platform/firebase/core.dart';
import 'package:app_boilerplate/platform/firebase/crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants/routes.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await initFirebase();

  //TODO. message 처리 필요
}

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized(); // async로 할 때 반드시 호출
    await Hive.initFlutter();
    await initFirebase();
    await initFirebasePackages();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp(MyApp());
  }, (error, stack) {
    recordCrashlyticsError(error, stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) {
        // 시스템 폰트 크기 무시
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child!);
      },
      theme: ThemeData(
        fontFamily: 'Pretendard',
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      initialRoute: Routes.home,
      getPages: [...Routes.pages],
    );
  }
}
