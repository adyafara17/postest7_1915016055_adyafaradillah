import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomController extends GetxController {
  var pageIndex = 0.obs;

  void ChangePageIndex(int index) {
    pageIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
