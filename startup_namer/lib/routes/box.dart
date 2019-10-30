import 'package:flutter/material.dart';

class Box extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BoxState();
  }
}

class _BoxState extends State<Box> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Widget'),
      ),
      body: Center(
          child: AnimatedOpacity(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.green,
        ),
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(microseconds: 500),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}
