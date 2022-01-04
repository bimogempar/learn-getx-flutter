import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  //TODO: Implement AddController

  late TextEditingController name;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
  }

  @override
  void onClose() {
    name.dispose();
  }
}
