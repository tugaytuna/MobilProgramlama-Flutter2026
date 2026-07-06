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

  TextEditingController yasController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void butonTiklandi() {
    setState(() {
      _counter--;
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
              onPressed: () {
                // String text1 = "deneme";
                String text1 = yasController.text;
                int yasRakam = int.parse(text1);
                setState(() {
                  _counter += 2;

                  if (yasRakam > 18) {
                    deger = "Giriş yapabilirsiniz!";
                  } else {
                    deger = "Giriş yapamazsınız!";
                  }
                });
              },
              child: Text("Kaydet"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                elevation: 8,
              ),
            ),
            TextField(
              controller: yasController,
              decoration: InputDecoration(
                labelText: "Yaşınızı Giriniz...",
                border: OutlineInputBorder(),
              ),
            ),
            Text(deger),
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
