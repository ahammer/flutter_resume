
import 'package:flutter/material.dart';
import 'package:resume_flutter/particles.dart';
import 'animated_painter.dart';
class SecondaryScreen extends StatelessWidget {
  final String title;
  final Widget body;
  
  const SecondaryScreen({
    Key key, @required this.title, @required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[        
        AnimatedPaint(painter: kParticlesAnimation),
        Container(width: double.infinity, height: double.infinity,
        child:  body,
        
        ),
      ],
    );
  }
}