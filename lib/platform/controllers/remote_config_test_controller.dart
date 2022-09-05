import 'package:app_boilerplate/platform/firebase/remote_config.dart';
import 'package:app_boilerplate/platform/helpers/base_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoteConfigTestViewController extends GetxController {
  final RxString _remoteMinVersion = RxString('');

  String get remoteMinVersion {
    return _remoteMinVersion.value;
  }

  @override
  void onInit() {
    _remoteMinVersion.value = getConfig(dataType: ConfigType.string, configKey: 'minimum_app_version');
    super.onInit();
  }

  void checkVersion() async {
    bool needUpdate = await isUpdateTarget();
    String message;
    if (needUpdate) {
      message = '업데이트가 필요합니다.';
    } else {
      message = '최신버전 입니다.';
    }
    Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          title: Text('업데이트 확인'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text("뒤로가기"),
            ),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text("확인"),
            ),
          ],
        ),
        barrierDismissible: false,
        useSafeArea: true);
  }
}
