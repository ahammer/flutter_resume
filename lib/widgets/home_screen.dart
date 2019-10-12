import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/animated_painter.dart';
import 'package:resume_flutter/widgets/business_card.dart';
import 'package:resume_flutter/particles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black),
      AnimatedPaint(painter: kParticlesAnimation),
      Center(child: BusinessCard())
    ]);
  }
}
