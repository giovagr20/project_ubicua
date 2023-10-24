//
// @author: Giovanni Gomez Restrepo //
// @github: giovagr20

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calc Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calc Notes'),
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

  final int _quantityNote = 4;
  double _averageNote = 0;
  String _result = "";
  final _note1 = TextEditingController();
  final _note2 = TextEditingController();
  final _note3 = TextEditingController();
  final _note4 = TextEditingController();


  void _average() {
    setState(() {
      _averageNote = (
          double.parse(_note1.text) +
          double.parse(_note2.text) +
          double.parse(_note3.text) +
          double.parse(_note4.text)) / _quantityNote;

      _result = _averageNote >= 3.0 ? "Passed" : "Failed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _note1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "First grade",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _note2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Second grade",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _note3,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Third grade",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: _note4,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Fourth grade",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              OutlinedButton.icon(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                icon: const Icon(Icons.calculate_outlined, size: 30),
                label: const Text("Calculate"),
                onPressed: () {
                  _average();
                },
              ),
              Text(
                'You $_result with note $_averageNote',
                style: const TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
