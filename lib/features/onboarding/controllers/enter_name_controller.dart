import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterNameController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Rx<String> userName = ''.obs;

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  void updateName(String value) {
    userName.value = value;
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  String getUserName() => nameController.text.trim();

  void clearForm() {
    nameController.clear();
    userName.value = '';
  }
}
