import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest6_1915016055_adyafaradillah/main.dart';
import 'package:postest6_1915016055_adyafaradillah/splash_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5), () {
      Get.off(MyHomePage());
    });
  }
}
