import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    themeMode:ThemeMode.dark,
        routes: {
          "/": (_) => RootScreen(),
          "/Resume": (_) => ResumeScreen(),
          "/About": (_) => AboutMeScreen(),
        },
      );
}

class ResumeScaffold extends StatelessWidget {
  final Widget body;

  const ResumeScaffold({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: const Text("Adam Hammer")), body: body);
}

class RootScreen extends StatelessWidget {
  @override
  build(BuildContext context) {
    final tiles = [
      HomeScreenCard(title: "About", asset: "assets/bg1.jpg"),
      HomeScreenCard(title: "Experience", asset: "assets/bg2.jpg"),
      HomeScreenCard(title: "Skills", asset: "assets/bg3.jpg"),
      HomeScreenCard(title: "Contact", asset: "assets/bg4.jpg"),
    ];

    return ResumeScaffold(
        body: Container(
            width: double.infinity,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(tiles.length, (index) => tiles[index]),
            )));
  }
}

class HomeScreenCard extends StatelessWidget {
  final String title;
  final String asset;
  const HomeScreenCard({
    Key key, this.title, this.asset
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FlatButton(padding: EdgeInsets.all(8),
            child: Stack(children: [
          Center(
              child: Image.asset(
            asset,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          )),
          Card(color: Color.fromARGB(128,0,0,0),child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(title, style: Theme.of(context).textTheme.display3),
          ))
        ]), onPressed: () {
          Navigator.pushNamed(context, "/resume");          
        },
      ),
    );
  }
}

class ResumeScreen extends StatelessWidget {
  @override
  build(BuildContext context) =>
      ResumeScaffold(body: Card(child: Text("Adam Hammer")));
}

class AboutMeScreen extends StatelessWidget {
  @override
  build(BuildContext context) =>
      ResumeScaffold(body: Card(child: Text("Adam Hammer")));
}
