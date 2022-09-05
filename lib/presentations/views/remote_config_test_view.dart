import 'package:app_boilerplate/platform/controllers/remote_config_test_controller.dart';
import 'package:app_boilerplate/presentations/components/default_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoteConfigTestView extends StatelessWidget {
  const RemoteConfigTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RemoteConfigTestViewController remoteConfigTestViewController = Get.put(RemoteConfigTestViewController());
    return DefaultContainer(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            return Text('리모트 컨피그 min_version 값: ${remoteConfigTestViewController.remoteMinVersion}');
          }),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () => remoteConfigTestViewController.checkVersion(),
              child: Text('버전 확인'),
            ),
          )
        ],
      ),
    ));
  }
}
