import 'package:flutter/material.dart';
// importing external package to generate english words.
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

// Application entry point
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(), // homepage should point to the RandomWords widget
        debugShowCheckedModeBanner:
            false); // disable the top right banner for debug
  }
}

// statefulwidget to keep track of the state of the application
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  // suggestions variable is private variable accessble only in this library
  // list of words
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
        ),
        body: _buildSuggestions());
  }

  // building list of suggestion names
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return const Divider();
          }

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // creating the row widget in the list
  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
  }
}
