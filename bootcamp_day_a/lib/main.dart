
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------


import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

//-------adding english words package-----------

//-------main func running class myapp------------
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to MY Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to Flutter'),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }

//------------------------------STATE LESS WIDGET------------------
// void main()
// {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     final wordPair = WordPair.random();
//     return MaterialApp(
//       title: 'Welcome to my first flutter app',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Welcome to my b flutter'),
//         ),
//         body: Center(
//           child: Text(wordPair.asPascalCase),
//         ),
//       ),
//     );
//   }
// }

//-----------------------STATEFUL WIDGET----------------------
//
// void main()
// {
//   runApp(MyApp());
// }
//
// class RandomWords extends StatefulWidget{
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }
//
// class _RandomWordsState extends State<RandomWords>{
//   @override
//   Widget build(BuildContext context)
//   {
//     // return Container(); replacing it
//     final wordPair = WordPair.random();
//     return Text(wordPair.asPascalCase);
//   }
// }
//
// class MyApp extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context)
//   {
//     final wordPair = WordPair.random();
//
//     return MaterialApp
//       (
//       title: 'Welcome to my first Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to c flutter'),
//         ),
//         body: Center(
//           child: RandomWords(),
//         ),
//       ),
//     );
//   }
// }

//------------------------first app--------------------

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
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    // return Container(); replacing it
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase); delete these

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup name generator'),
      ),
      body: _buildSuggestions(),
    );


  }
  Widget _buildRow(WordPair pair)
  {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
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
  // Widget build(BuildContext context)
  // {
  //   final wordPair = WordPair.random();
  //
  //   return MaterialApp
  //     (
  //     title: 'Welcome to my first Flutter',
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Welcome to c flutter'),
  //       ),
  //       body: Center(
  //         child: RandomWords(),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}