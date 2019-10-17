import 'package:flutter/material.dart';
import 'package:flutter_shop/movies_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Shop',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.deepPurple,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Movie List'),
          ),
          body: MoviesService(firstMovie: 'Avengers: Endgame'),
      )
    );
  }
}
