import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hesap Makinası',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Hesap Makinası'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String ekranSonuc = "0";

  double ilkSayi = 0;
  double ikinciSayi = 0;
  String islem = "";

  Widget butonOlustur(String rakam) {
    return ElevatedButton(
      onPressed: () {
        if (rakam == "C") {
          setState(() {
            ilkSayi = 0;
            ikinciSayi = 0;
            ekranSonuc = "0";
          });
        } else if (rakam == "+") {
          setState(() {
            ilkSayi = double.parse(ekranSonuc);
            islem = "+";
            ekranSonuc = "0";
          });
        } else if (rakam == "=") {
          setState(() {
            ikinciSayi = double.parse(ekranSonuc);
            // islemi kontrol et işleme göre sonuç üret
            ekranSonuc = (ilkSayi + ikinciSayi).toString();
          });
        } else {
          setState(() {
            if (ekranSonuc == "0") {
              ekranSonuc = rakam;
            } else {
              ekranSonuc += rakam;
            }
          });
        }
      },
      child: Text(rakam),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text("Hesap Makinası", style: TextStyle(fontSize: 30)),
          Container(child: Center(child: Text(ekranSonuc))),

          Row(
            children: [butonOlustur("7"), butonOlustur("8"), butonOlustur("9")],
          ),
          Row(
            children: [butonOlustur("4"), butonOlustur("5"), butonOlustur("6")],
          ),
          Row(
            children: [butonOlustur("1"), butonOlustur("2"), butonOlustur("3")],
          ),

          Row(children: [butonOlustur("C"), butonOlustur("0")]),
          Row(children: [butonOlustur("+"), butonOlustur("=")]),
        ],
      ),
    );
  }
}
