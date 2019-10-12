import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/business_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: BusinessCard());
  }
}
