import 'package:firebase_analytics/firebase_analytics.dart';

void logEvent({required String eventName, String? actionType, String? eventDesc}) async {
  await FirebaseAnalytics.instance.logEvent(
    name: eventName,
    parameters: {
      "action": actionType,
      "desc": eventDesc,
    },
  );
}
