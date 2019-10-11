import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/animated_painter.dart';
import 'package:resume_flutter/particles.dart';


class AboutScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
    return Stack(
      children: <Widget>[
        Container(color: Colors.black, width: double.infinity, height: double.infinity),
        AnimatedPaint(painter: kParticlesAnimation),
        Container(width: double.infinity, height: double.infinity,
        child: Scaffold(backgroundColor: Theme.of(context).primaryColorDark.withAlpha(225),
          appBar: AppBar(title: Text("Title"),),
        ),
        ),
      ],
    );
  }

}