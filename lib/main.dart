import 'package:flutter/material.dart';
import 'package:resume_flutter/screens/about/about_screen.dart';
import 'package:resume_flutter/theme.dart';
import 'package:resume_flutter/widgets/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
              
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getTheme(),
      home: AboutScreen(),
    );
  }
}
