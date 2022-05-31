import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest6_1915016055_adyafaradillah/splashscreen_ctrl.dart';
import 'package:postest6_1915016055_adyafaradillah/home.dart';
import 'package:postest6_1915016055_adyafaradillah/main.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController spc = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "logo.jpg",
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
