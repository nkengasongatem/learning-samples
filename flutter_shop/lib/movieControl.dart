import 'package:flutter/material.dart';

class Moviecontrol extends StatelessWidget {

  final Function addMovie;

  Moviecontrol(this.addMovie);
    
  @override
  Widget build(BuildContext context) { 
    return RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text('Add Movie'),
            onPressed: () {
              addMovie('Doctor Strange');
            },
          );
  }
}