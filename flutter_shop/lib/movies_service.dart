import 'package:flutter/material.dart';

import 'movies.dart';
import 'movieControl.dart';

class MoviesService extends StatefulWidget {
  final String firstMovie;

  MoviesService({this.firstMovie = 'Captain America: The Winter Soldier'});

  @override
  State<StatefulWidget> createState() {
    return _MoviesService();
  }
}

class _MoviesService extends State<MoviesService> {
  List<String> _movies = [];

  @override
  void initState() {
    _movies.add(widget.firstMovie);
    super.initState();
  }

  @override
  void didUpdateWidget(MoviesService oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void _addMovie(String movie) {
    setState(() {
      _movies.add(movie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: Moviecontrol(_addMovie),
        ),
        Movies(_movies)
      ],
    );
  }
}
