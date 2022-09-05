import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

Future<void> initDynamicLink() async {
  final PendingDynamicLinkData? initialLink = await FirebaseDynamicLinks.instance.getInitialLink();

  if (initialLink != null) {
    Get.toNamed(initialLink.link.path);
  }

  listenToDynamicLink();
}

void listenToDynamicLink() {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
    // Get.toNamed(dynamicLinkData.link.path);
  }).onError((error) {
    // Handle errors
  });
}
