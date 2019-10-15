import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_flutter/theme.dart';

class ComingSoon extends StatefulWidget {
  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat();
          animation = Tween<double>(begin: -2000, end: 2000).animate(controller);
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        child: Center(
            child: Text(
          "Coming Soon",
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(fontFamily: kDefaultFont, fontSize: 72),
        )),
        animation: animation,
        builder: (BuildContext context, Widget child) => Transform(
              child: child,
              transform: Transform.translate(offset:Offset(animation.value,0)).transform,
              alignment: FractionalOffset.center,
            ));
  }
}
