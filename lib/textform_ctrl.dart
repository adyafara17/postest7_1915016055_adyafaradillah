import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormController extends GetxController {
  final _minimumPadding = 5.0;
  TextEditingController namactrl = TextEditingController();
  TextEditingController alamatctrl = TextEditingController();
  TextEditingController nohpctrl = TextEditingController();
  TextEditingController carctrl = TextEditingController();

  // onPressed() {
  //   nama = namactrl.text.obs;
  //   alamat = alamatctrl.text.obs;
  //   nohp = nohpctrl.text.obs;
  //   car = carctrl.text.obs;
  // }

  @override
  void onClose() {
    namactrl.dispose();
    alamatctrl.dispose();
    nohpctrl.dispose();
    carctrl.dispose();
    print("Terhapus");
    super.onClose();
  }
}
