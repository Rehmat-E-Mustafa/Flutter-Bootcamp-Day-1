
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//---------------- second app part 2----------------
void main()
{
  runApp(MyApp());
}

class RandomWords extends StatefulWidget{
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup name generator'),
      ),
      body: _buildSuggestions(),
    );


  }
  Widget _buildRow(WordPair pair)
  {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved? Icons.favorite : Icons.favorite_border,
        color: alreadySaved? Colors.black : null,
        semanticLabel: alreadySaved? 'Remove from saved' : 'Save',
      ),
      onTap: ()
      {
        setState(()
        {
          if(alreadySaved)
            {
              _saved.remove(pair);
            }
          else
            {
              _saved.add(pair);
            }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder
      (
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
      },
    );
  }
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}