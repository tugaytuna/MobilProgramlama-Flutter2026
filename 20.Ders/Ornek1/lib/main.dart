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
      title: 'Örnek Proje',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Örnek Proje Uygulaması'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _dCounter() {
    setState(() {
      if(_counter > 0){
        _counter--;
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Sıfırdan düşük olamaz!"))
        );
      }

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
            const Text('Butona tıklanma sayacı:', style: TextStyle(fontSize: 20),),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 50),
            ),
            Text('Deneme 1-2-3', style: TextStyle(color: Colors.green),),

          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
          FloatingActionButton(
            onPressed: _dCounter,
            tooltip: 'Decrease',
            child: const Icon(Icons.remove),
          ),]
      )

    );
  }
}
