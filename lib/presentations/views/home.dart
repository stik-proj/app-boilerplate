import 'package:app_boilerplate/constants/routes.dart';
import 'package:app_boilerplate/platform/services/global_service.dart';
import 'package:app_boilerplate/presentations/components/default_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalService globalService = Get.put(GlobalService());

    return DefaultContainer(
      customHeader: SizedBox(
        width: double.infinity,
        height: context.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '스타이카 보일러플레이트 프로젝트',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return Text(
                globalService.welcomeMessage.value,
                textAlign: TextAlign.center,
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.remoteConfigTest),
                child: const Text('리모트 컨피그 테스트'),
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.welcomeEditor),
              child: const Text('웰컴메세지 변경 페이지'),
            ),
          ],
        ),
      ),
    );
  }
}
