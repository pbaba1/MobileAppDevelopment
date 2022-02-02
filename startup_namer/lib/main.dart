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
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
      ),
      home: RandomWords(), // homepage should point to the RandomWords widget
      debugShowCheckedModeBanner: false,
    ); // disable the top right banner for debug
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
  // set to save the user's favourite words
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Startup Name Generator'),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved,
              tooltip: 'Saved Suggestions',
            )
          ],
        ),
        body: _buildSuggestions());
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      final tiles = _saved.map((pair) {
        return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
      });
      final divided = tiles.isNotEmpty
          ? ListTile.divideTiles(context: context, tiles: tiles).toList()
          : <Widget>[];
      return Scaffold(
          appBar: AppBar(title: const Text('Saved Suggestions')),
          // backgroundColor: Colors.amberAccent),
          body: ListView(children: divided));
    }));
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
    final _alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      // adding a heart icon to indicate user has saved the word
      trailing: Icon(
        _alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: _alreadySaved ? Colors.red : null,
        semanticLabel: _alreadySaved ? 'Remove from saved' : 'Save',
      ),
      // add interactivity - when clicked on the icon what should happen
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
