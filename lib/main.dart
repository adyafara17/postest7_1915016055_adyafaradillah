import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'cubit/buttom_cubit.dart';
// import 'package:postest6_1915016055_adyafaradillah/cubit/buttom_cubit.dart';
import 'package:postest6_1915016055_adyafaradillah/splash_screen.dart';
import 'package:postest6_1915016055_adyafaradillah/home.dart';
import 'package:postest6_1915016055_adyafaradillah/form.dart';
import 'cubit/buttom_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Dua widget diatas penting
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final BottomController myBottomController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    // var pages = _pages;
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: myBottomController.pageIndex.value,
            onTap: myBottomController.ChangePageIndex,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: "Booking",
                icon: Icon(Icons.payment),
              ),
            ],
          )),
      body: Obx(
        () => IndexedStack(
          index: myBottomController.pageIndex.value,
          children: [HomePage(), formpage()],
        ),
      ),
    );
  }
}

Widget gambar() {
  return Container(
    width: 200,
    height: 200,
    padding: const EdgeInsets.all(4.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset('assets/logo.jpg'),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(234, 67, 3, 3),
        // margin: EdgeInsets.all(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                // padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  '-Pencucian Mobil- ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Color.fromARGB(220, 240, 225, 151),
                  ),
                ),
              ),
              gambar(),
              ElevatedButton(
                onPressed: () {
                  Get.to(MainPage());
                },
                child: Text("Masuk"),
              ),
            ]),
      ),
    );
  }
}
