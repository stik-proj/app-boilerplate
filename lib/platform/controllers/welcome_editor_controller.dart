import 'package:app_boilerplate/platform/services/global_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WelcomeEditorController extends GetxController {
  final GlobalService _globalService = Get.find();

  TextEditingController editingController = TextEditingController();

  @override
  void onInit() {
    editingController.text = _globalService.welcomeMessage.value;
    super.onInit();
  }

  void updateWelcomeMessage() {
    _globalService.welcomeMessage.value = editingController.text;
    Get.back();
    Get.snackbar('안내', '변경이 완료 되었습니다.');
  }
}
