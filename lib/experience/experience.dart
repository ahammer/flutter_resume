
import 'package:flutter/material.dart';
import 'package:resume_flutter/details_screen.dart';
import 'package:resume_flutter/main.dart';

class ResumeScreen extends StatelessWidget {
  @override
  build(BuildContext context) => ResumeScaffold(
      body: DetailsScreen(title: "Experience", asset: "assets/bg2.jpg"));
}