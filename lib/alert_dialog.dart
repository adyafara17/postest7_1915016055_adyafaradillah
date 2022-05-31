import 'package:flutter/material.dart';
import 'package:postest6_1915016055_adyafaradillah/main.dart';

Future<dynamic> Alertdialog(BuildContext context, String text) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color.fromARGB(234, 135, 23, 23),
        actions: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 20),
                Image.asset(
                  "K.png",
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MyHomePage()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 100, 31, 6),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Tekan Lagi Untuk Keluar",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 249, 199, 124)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
