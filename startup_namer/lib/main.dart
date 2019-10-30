import 'package:flutter/material.dart';

import 'random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Learning Flutter',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: RandomWords()
    );
  }
}

// stful
// stles