import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:cubit/cubit.dart';
// import 'cubit/buttom_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget judul() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        '-CAR WASH UFYA-',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
          fontSize: 25,
          color: Color.fromARGB(220, 240, 225, 151),
        ),
      ),
    );
  }

  Widget gambar() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/gambar2.jpg")),
        border: Border.all(color: Color.fromARGB(255, 194, 171, 109), width: 5),
      ),
    );
  }

  Widget gambar1() {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/carwash1.jpg'),
      ),
    );
  }

  Widget gambar2() {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/carwash2.jpg'),
      ),
    );
  }

  Widget gambar3() {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/carwash3.jpg'),
      ),
    );
  }

  Widget deskripsi() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        '"Pencucian mobil UFYA menggunakan alat hidrolik,'
        ' sehingga membuat mobil akan menjadi bersih dengan maksimal"',
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontWeight: FontWeight.w200,
          letterSpacing: 0.1,
          fontSize: 15,
          color: Color.fromARGB(255, 219, 210, 203),
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(234, 77, 21, 2),
        child: ListView(children: [
          judul(),
          gambar(),
          deskripsi(),
          icontempat(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              gambar1(),
              gambar2(),
              gambar3(),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text('Adya Faradillah ~ 1915016055',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 5, color: Color.fromARGB(255, 215, 240, 240))),
            color: Colors.black45,
          ),
        ]),
      ),
    );
  }
}
