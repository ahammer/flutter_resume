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
    return Center(child: BusinessCard());
  }
}
