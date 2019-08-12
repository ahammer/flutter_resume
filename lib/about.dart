import 'package:flutter/material.dart';

import 'details_screen.dart';
import 'main.dart';

class AboutEntry {
  final String title;
  final String text;
  final String asset;
  AboutEntry(this.title, this.text, this.asset);
}

class AboutMeScreen extends StatelessWidget {
  @override
  build(BuildContext context) {
    final aboutMe = [
      AboutEntry(
          "Intro",
          "    My name is Adam Hammer and I'm a full stack Software Developer in Vancouver, BC. My specialty is Mobile development in Flutter and Java. In my spare time I develop a wide variety of independent projects. \n\n    My passion for programming started at the age of 10, and has been not only a profession but a hobby for a large portion of my life. I've always strived to continuously improve my skills in the craft.",
          "assets/bg5.jpg"),
      AboutEntry(
          "Intro",
          "    My name is Adam Hammer and I'm a full stack Software Developer in Vancouver, BC. My specialty is Mobile development in Flutter and Java. In my spare time I develop a wide variety of independent projects. \n\n    My passion for programming started at the age of 10, and has been not only a profession but a hobby for a large portion of my life. I've always strived to continuously improve my skills in the craft.",
          "assets/bg5.jpg"),
      AboutEntry(
          "Intro",
          "    My name is Adam Hammer and I'm a full stack Software Developer in Vancouver, BC. My specialty is Mobile development in Flutter and Java. In my spare time I develop a wide variety of independent projects. \n\n    My passion for programming started at the age of 10, and has been not only a profession but a hobby for a large portion of my life. I've always strived to continuously improve my skills in the craft.",
          "assets/bg5.jpg"),
    ];

    return ResumeScaffold(
        body: DetailsScreen(
            title: "About",
            asset: "assets/bg1.jpg",
            body: ListView.builder(
              itemCount: aboutMe.length,
              itemBuilder: (context, idx) => AboutMeEntry(
                imageOnLeft: idx % 2 == 0,
                entry: aboutMe[idx],
              ),
            )));
  }
}

class AboutMeEntry extends StatelessWidget {
  final AboutEntry entry;
  final bool imageOnLeft;
  const AboutMeEntry({Key key, this.entry, this.imageOnLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Padding(
      padding: const EdgeInsets.all(32.0),
      child: Image.asset(
        entry.asset,
        fit: BoxFit.cover,
        width: 240,
        height: 240,
      ),
    );

    final text = Expanded(
        child: Text(
      entry.text,
      style: Theme.of(context).textTheme.display1,
    ));

    Widget rowWidget;
    if (imageOnLeft) {
      rowWidget = Row(
        children: <Widget>[
          image,
          text,
        ],
      );
    } else {
      rowWidget = Row(
        children: <Widget>[
          text,
          image,
        ],
      );
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(entry.title, style: Theme.of(context).textTheme.display3,),
        ),
        rowWidget,
        Container(height:32)
      ],
    );
  }
}
