import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; 

import 'routes/category.dart';
import 'routes/physics_animation.dart';
import 'routes/animation.dart';
import 'routes/box.dart';
import 'routes/screen_orientation.dart';

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RandomWordsState();
  }
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _favorited = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Open Drawer',
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          title: Text('Startup Name Generator'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
                ),
              ),
              ListTile(
                title: Text(
                  'Tab Navigation',
                  style: _biggerFont,
                ),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  Navigator.of(context).push(_createRoute(Category()));
                },
              ),
              ListTile(
                title: Text(
                  'Image Animation',
                  style: _biggerFont,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(_createRoute(PhysicsAnimation()));
                },
              ),
              ListTile(
                title: Text(
                  'Container Animation',
                  style: _biggerFont,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(_createRoute(MyAnimatedContainer()));
                },
              ),
              ListTile(
                title: Text(
                  'Opacity Animation',
                  style: _biggerFont,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(_createRoute(Box()));
                },
              ),
              ListTile(
                title: Text(
                  'SnackBar Demo',
                  style: _biggerFont,
                ),
                onTap: () {
                  Navigator.pop(context);
                  final snackBar = SnackBar(
                    content: Text('Yay! A SnackBar!'),
                    action: SnackBarAction(
                      label: 'Undo', 
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  ); 
                  _scaffoldKey.currentState.showSnackBar(snackBar);
                },
              ),
              ListTile(
                title: Text(
                  'App Orientation',
                  style: _biggerFont,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(_createRoute(ScreenOrientation()));
                },
              ),
            ],
          ),
        ),
        body: _buildSuggestions());
  }

  // build route
  Route _createRoute(Object object) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => object,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        // combine the curveTween & the Tween<Offset>
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // build a route to favorite names
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles =
              _favorited.map((WordPair pair) => ListTile(
                    title: Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  ));
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('Favorite Suggestions'),
            ),
            body: ListView(children: divided),
          ); // ... to here.
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadyFaved = _favorited.contains(pair);
    return ListTile(
        leading: Icon(
          Icons.ac_unit,
          size: 40.0,
        ),
        subtitle: Text(pair.asLowerCase.length.toString()),
        isThreeLine: false,
        dense: true,
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: Icon(
          alreadyFaved ? Icons.favorite : Icons.favorite_border,
          color: alreadyFaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadyFaved) {
              _favorited.remove(pair);
            } else
              _favorited.add(pair);
          });
        },
        onLongPress: _longPressCallback);
  }

  _longPressCallback() {
    print('Do something');
  }
}
