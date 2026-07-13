import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yaş Kontrol',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Yaş Kontrol'),
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
  int _counter = 0;
  String deger = "";
  Color yaziRengi = Colors.black;
  bool hata = false;
  int fark = 0;
  String sehir = "";

  TextEditingController yasController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void butonTiklandi() {
    // String text1 = "deneme";

    // String text1 = yasController.text;
    // int yasRakam = int.parse(text1);

    int yasRakam = int.parse(yasController.text);

    setState(() {
      _counter += 2;

      if (yasRakam > 18) {
        deger = "Giriş yapabilirsiniz!";
        yaziRengi = Colors.green;
        hata = false;
      } else {
        yaziRengi = Colors.red;
        hata = true;
        fark = 18 - yasRakam;
        deger = "Giriş yapamazsınız! $fark yıl sonra görüşürüz.";
      }

      deger += " $sehir şehrinden hoş geldiniz!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: butonTiklandi,
              child: Text("Kaydet"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 8,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                  left: 35,
                  right: 35,
                ),
              ),
            ),
            TextField(
              controller: yasController,
              decoration: InputDecoration(
                labelText: "Yaşınızı Giriniz...",
                border: OutlineInputBorder(),
              ),
            ),
            DropdownButton(
              value: sehir,
              items: [
                DropdownMenuItem(value: "İstanbul", child: Text("İstanbul")),
                DropdownMenuItem(value: "İzmir", child: Text("İzmir")),
                DropdownMenuItem(value: "Adana", child: Text("Adana")),
                DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
              ],
              onChanged: (yeniDeger) {
                setState(() {
                  sehir = yeniDeger!;
                });
              },
            ),
            Text(
              deger,
              style: TextStyle(color: yaziRengi, fontSize: hata ? 20 : 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
