import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'details_screen.dart';
import 'home_screen_panel.dart';

void main() {
  _setTargetPlatformForDesktop();
  runApp(ResumeMaterialApp());
}

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class ResumeMaterialApp extends StatelessWidget {
  @override
  build(BuildContext context) => MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        routes: {
          "/": (_) => RootScreen(),
          "/Resume": (_) => ResumeScreen(),
          "/About": (_) => AboutMeScreen(),
          "/Skills": (_) => SkillScreen(),
          "/Contact": (_) => ContactScreen(),
        },
      );
}

class ResumeScaffold extends StatelessWidget {
  final Widget body;
  const ResumeScaffold({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
        body: body));
  }
}

class RootScreen extends StatelessWidget {
  @override
  build(BuildContext context) {
    final tiles = [
      HomeScreenCard(title: "About", asset: "assets/bg1.jpg", route: "/About"),
      HomeScreenCard(title: "Experience", asset: "assets/bg2.jpg", route: "/Resume"),
      HomeScreenCard(title: "Skills", asset: "assets/bg3.jpg", route: "/Skills"),
      HomeScreenCard(title: "Contact", asset: "assets/bg4.jpg", route: "/Contact"),
    ];

    return ResumeScaffold(
        body: Container(
            width: double.infinity,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 1,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(tiles.length, (index) => tiles[index]),
            )));
  }
}



class AboutMeScreen extends StatelessWidget {
  @override
  build(BuildContext context) => ResumeScaffold(
      body: DetailsScreen(title: "About", asset: "assets/bg1.jpg"));
}

class ResumeScreen extends StatelessWidget {
  @override
  build(BuildContext context) => ResumeScaffold(
      body: DetailsScreen(title: "Experience", asset: "assets/bg2.jpg"));
}

class SkillScreen extends StatelessWidget {
  @override
  build(BuildContext context) => ResumeScaffold(
      body: DetailsScreen(title: "Skills", asset: "assets/bg3.jpg"));
}

class ContactScreen extends StatelessWidget {
  @override
  build(BuildContext context) => ResumeScaffold(
      body: DetailsScreen(title: "Contact", asset: "assets/bg4.jpg"));
}
