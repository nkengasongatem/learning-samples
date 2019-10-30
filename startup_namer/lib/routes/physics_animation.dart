import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Logo Animation'),
        ),
        body: DraggableCard(
            child: FlutterLogo(
          size: 128,
        )));
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;

  DraggableCard({this.child});

  @override
  State<StatefulWidget> createState() {
    return _DraggableCardState();
  }
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
    super.initState();
  }

  @override
  void didUpdateWidget(DraggableCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller
        .drive(AlignmentTween(begin: _dragAlignment, end: Alignment.center));
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
        onPanDown: (details) {
          _controller.stop();
        },
        onPanUpdate: (details) {
          setState(() {
            _dragAlignment += Alignment(
              details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2),
            );
          });
        },
        onPanEnd: (details) {
          _runAnimation(details.velocity.pixelsPerSecond, size);
        },
        child: Align(
          alignment: _dragAlignment,
          child: Card(
            child: widget.child,
          ),
        ));
  }
}
