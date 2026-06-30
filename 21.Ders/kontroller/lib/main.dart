import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yeni Örnek',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.yellow),
      ),
      home: const MyHomePage(title: '29 Haziran'),
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
  TextEditingController text1controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void butonTiklandi(){
    setState(() {

  //_counter = int.parse(text1controller.text);

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
            const Text('You have pushed the button this many times:', style: TextStyle(
              fontSize: 18, color: Colors.green
            ),),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextField(controller: text1controller, decoration: InputDecoration(
              labelText: 'Buraya kullanıcı adınızı giriniz...'
            ),),
            ElevatedButton(
              onPressed: butonTiklandi,
              child: Text("Kaydet"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.favorite_border, color: Colors.red,),
      ),
    );
  }
}
