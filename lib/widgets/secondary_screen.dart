
import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/animated_painter.dart';
import 'package:resume_flutter/particles.dart';

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
        Container(color: Colors.black, width: double.infinity, height: double.infinity),
        AnimatedPaint(painter: kParticlesAnimation),
        Container(width: double.infinity, height: double.infinity,
        child: Scaffold(backgroundColor: Theme.of(context).primaryColorDark.withAlpha(200),
          appBar: AppBar(title: Text(title)),
          body: body,
        ),
        ),
      ],
    );
  }
}