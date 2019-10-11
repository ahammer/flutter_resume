import 'dart:math';

import 'package:flutter/material.dart';
import 'package:resume_flutter/particles.dart';
import 'package:resume_flutter/widgets/animated_painter.dart';
import 'package:resume_flutter/widgets/business_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black,
          textTheme: TextTheme(
              display1: TextStyle(
                  fontFamily: "Helvetica",
                  color: Colors.white54,
                  fontSize: 24,
                  shadows: [
                    Shadow(
                        color: Colors.black45,
                        offset: Offset(4, 4),
                        blurRadius: 4)
                  ]),
              display3: TextStyle(
                fontFamily: "Helvetica",
                color: Colors.white,
                fontSize: 42,
              ),
              display4: TextStyle(fontFamily: "Helvetica"))),
      home: Stack(children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black),
        AnimatedPaint(painter: ParticlesAnimation()),
        Center(child: BusinessCard())
      ]),
    );
  }
}

class FlashPainter extends AnimatedPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, 200.0), width: 50.0, height: 50.0),
        Paint()
          ..color = Color.fromARGB(255, Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255)));
  }

  @override
  void step(double frameTime) {
    // TODO: implement step
  }
}

class ParticlesAnimation extends AnimatedPainter {
  ParticlePainter painter = ParticlePainter(Particles());
  Size size;

  @override
  void paint(Canvas canvas, Size size) {
    this.size = size;
    painter.paint(canvas, size);
  }

  @override
  void step(double frameTime) {
    if (size != null) {
      painter.step(frameTime, size);
    }
  }
}
