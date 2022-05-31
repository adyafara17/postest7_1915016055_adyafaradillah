import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postest6_1915016055_adyafaradillah/Firestore_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:postest6_1915016055_adyafaradillah/home.dart';
import 'package:get/get.dart';
import 'package:postest6_1915016055_adyafaradillah/main.dart';
import 'package:postest6_1915016055_adyafaradillah/alert_dialog.dart';
import 'package:postest6_1915016055_adyafaradillah/textform_ctrl.dart';
import 'package:postest6_1915016055_adyafaradillah/TodoPage.dart';
import 'package:postest6_1915016055_adyafaradillah/crud_ctrl.dart';

class formpage extends StatelessWidget {
  formpage({Key? key}) : super(key: key);

  final FirestoreController fsc = Get.put(FirestoreController());
  final CrudController cc = Get.put(CrudController());

  Widget builder(context, snapshot) {
    return snapshot.hasData
        ? Column(
            children: snapshot.data!.docs
                .map<Widget>(
                  (e) => MyListTile(
                    title: e.get('nama'),
                    subtitle: e.get('nohp').toString(),
                    leadingText: e.get('car'),
                    onTap: () {
                      cc.id(e.id);
                      cc.nama(e.get('nama'));
                      cc.nohp(e.get('nohp'));
                      cc.car(e.get('car'));

                      Get.to(() => TodoPage(
                            isUpdate: true,
                          ));
                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (_) => CustomAlert(
                          id: e.id,
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          );
  }

  panggilTerus() {
    return StreamBuilder<QuerySnapshot>(
      stream: fsc.user.value.orderBy('nama').snapshots(),
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(234, 77, 21, 2),
          title: Text(
            '-CAR WASH UFYA-',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Color.fromARGB(220, 240, 225, 151),
            ),
          ),
        ),
        body: ListView(
          children: [
            // StreamBuilder<QuerySnapshot>(
            //   stream: fsc.user.value.orderBy('nama').snapshots(),
            //   builder: builder,
            // )
            panggilTerus(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => TodoPage()),
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(234, 77, 21, 2),
        ));
  }
}

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    FirestoreController fsc = Get.find();
    return AlertDialog(
      title: const Text('Hapus'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            fsc.user.value.doc(id).delete();
            Get.back();
          },
          child: const Text(
            'Hapus',
            style: TextStyle(color: Color.fromARGB(255, 58, 9, 9)),
          ),
        ),
      ],
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile(
      {Key? key,
      required this.leadingText,
      required this.title,
      required this.subtitle,
      this.onTap,
      this.onLongPress})
      : super(key: key);

  final String leadingText;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leadingText,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
      title: Text(title),
      subtitle: Text("Nomor Telphone $subtitle"),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}

Widget icontempat() {
  return Container(
    //margin: EdgeInsets.symmetric(vertical: 10),
    //padding: EdgeInsets.all(5),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
        Widget>[
      Icon(Icons.place, color: Colors.amber),
      Text('Jl. Kestela 9 ',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w100)),
      Icon(Icons.timer, color: Colors.amber),
      Text('08.00 - 17.00',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w100)),
      Icon(Icons.payment, color: Colors.amber),
      Text('Rp. 50.000',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w100)),
    ]),
  );
}
