//
// @author: Giovanni Gomez Restrepo //
// @github: giovagr20

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const Anagram());
}

class Anagram extends StatelessWidget {
  const Anagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Check Anagram',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
          useMaterial3: true,
        ),
        home: const AnagramPage(title: 'Anagram'));
  }
}

class AnagramPage extends StatefulWidget {
  const AnagramPage({super.key, required this.title});

  final String title;

  @override
  State createState() => _AnagramPageState();
}

class _AnagramPageState extends State<AnagramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: AnagramDetailPage(),
        ));
  }
}
class AnagramDetailPage extends StatefulWidget {
  const AnagramDetailPage({super.key});

  @override
  State createState() => _AnagramDetailPageState();
}

class _AnagramDetailPageState extends State<AnagramDetailPage> {

  final _textInput1 = TextEditingController();
  final _textInput2 = TextEditingController();

  String _result = '';

  void areAnagrams() {
    setState(() {
      _textInput1.text = _textInput1.text.replaceAll(" ", "").toLowerCase();
      _textInput2.text = _textInput2.text.replaceAll(" ", "").toLowerCase();

      String text1 = _textInput1.text;
      String text2 = _textInput2.text;
      List<String> charFirstWord = _textInput1.text.split("");
      List<String> charSecondWord = _textInput2.text.split("");

      if (_textInput1.text.length != _textInput2.text.length) {
        _result = 'No Anagrams';
      }

      charFirstWord.sort();
      charSecondWord.sort();

      bool isOk = const ListEquality().equals(charFirstWord, charSecondWord);

      if (!isOk) {
        _result = 'No Anagrams';
      } else {
        _result = 'Input 1 $text1 and Input 2 $text2 are anagram';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _textInput1,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'First input',
                hoverColor: Colors.indigoAccent),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _textInput2,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Second input',
                hoverColor: Colors.indigoAccent),
          ),
          const SizedBox(
            height: 10.0,
          ),
          OutlinedButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.calculate_outlined, size: 30),
            label: const Text("Check"),
            onPressed: () {
              areAnagrams();
            },
          ),
          const SizedBox(
            height: 60.0,
          ),
          Text(
            _result,
            style: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
