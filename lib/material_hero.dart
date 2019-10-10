import 'package:flutter/material.dart';

class MaterialHero extends StatelessWidget {
  final Widget child;
  final String tag;

  const MaterialHero({Key key, this.tag, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
  Material(child: Hero(tag: tag, child:child));
}