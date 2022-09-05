import 'package:app_boilerplate/platform/controllers/welcome_editor_controller.dart';
import 'package:app_boilerplate/presentations/components/default_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeEditor extends StatelessWidget {
  const WelcomeEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WelcomeEditorController _controller = Get.put(WelcomeEditorController());
    return DefaultContainer(
        child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('변경할 웰컴메세지를 입력해주세요'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _controller.editingController,
            ),
          ),
          ElevatedButton(
            onPressed: () => _controller.updateWelcomeMessage(),
            child: Text('윕컴 메세지 업데이트'),
          ),
        ],
      ),
    ));
  }
}
