import 'package:flutter/material.dart';

class Movies extends StatelessWidget {

  final List<String> movies;

  Movies(this.movies);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: movies
          .map(
            (title) => Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/gaunlet.jpeg'),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.display1,
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
