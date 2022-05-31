import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:postest6_1915016055_adyafaradillah/Firestore_ctrl.dart';
import 'package:postest6_1915016055_adyafaradillah/crud_ctrl.dart';
import 'package:postest6_1915016055_adyafaradillah/textform_ctrl.dart';
import 'package:postest6_1915016055_adyafaradillah/form.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key, this.isUpdate = false}) : super(key: key);

  bool isUpdate;

  @override
  Widget build(BuildContext context) {
    TextFormController tfc = Get.put(TextFormController());
    FirestoreController fsc = Get.find();
    CrudController cc = Get.find();

    if (isUpdate) {
      tfc.namactrl.text = cc.nama.value;
      tfc.nohpctrl.text = cc.nohp.value;
      tfc.carctrl.text = cc.car.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${this.isUpdate ? 'Update' : 'Tambah'} Data"),
      ),
      body: Container(
        color: Color.fromARGB(234, 77, 21, 2),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                TextField(
                  controller: tfc.namactrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama",
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: tfc.nohpctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "No HP",
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                TextField(
                  controller: tfc.carctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Merek Mobil / Nomor Plat",
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (this.isUpdate) {
                      fsc.user.value.doc(cc.id.value).update({
                        'nama': tfc.namactrl.text,
                        'nohp': int.tryParse(tfc.nohpctrl.text) ?? 1,
                        'car': tfc.carctrl.text,
                      });
                    } else {
                      fsc.user.value.add({
                        'nama': tfc.namactrl.text,
                        'nohp': int.tryParse(tfc.nohpctrl.text) ?? 1,
                        'car': tfc.carctrl.text,
                      });
                    }
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Terima Kasih Data atas nama ${tfc.namactrl.text} , nohp ${tfc.nohpctrl.text}, dan data mobil ${tfc.carctrl.text} berhasil ${this.isUpdate ? 'Diupdate' : 'Ditambahkan'}",
                        ),
                      ),
                    );
                  },
                  child: Text(this.isUpdate ? 'Update' : 'Tambah'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
