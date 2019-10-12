import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/secondary_screen.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SecondaryScreen(title: "About", body: AboutScreenBody());
}

const kHobbies = ["3D Printing", "Photography", "Robotics", "Gaming"];
const kSideNavWidth = 300.0;

class AboutScreenBody extends StatefulWidget {
  const AboutScreenBody({
    Key key,
  }) : super(key: key);

  @override
  _AboutScreenBodyState createState() => _AboutScreenBodyState();
}

class _AboutScreenBodyState extends State<AboutScreenBody> {
  bool opened = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - kSideNavWidth;
    final openOffset = kSideNavWidth-16.0;
    final closedOffset = -width - 16;
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: AnimatedOpacity(
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 600),
          opacity: opened?1:0,
          
          child: AnimatedContainer(
            curve: Curves.elasticOut,
              transform: Transform.translate(offset: Offset(opened?openOffset:closedOffset,0)).transform,
              duration: const Duration(milliseconds: 1000),
              width: width,
              height: double.infinity,
              color: Colors.white38),
        ),
      ),
      AboutScreenSidebar(onClick:toggleOpened),
    ]);
  }

  void toggleOpened(String button) {
    setState((){
      opened = !opened;
    });
  }
}

class AboutScreenSidebar extends StatelessWidget {
  final Function(String) onClick;
  
  const AboutScreenSidebar({
    Key key, this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kSideNavWidth,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Center(
                      child: Text("Hobbies",
                          style: Theme.of(context).textTheme.headline))),
              ...kHobbies.map((hobby) => Expanded(
                      child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                        child: Text(
                          hobby,
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () => onClick(hobby)),
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
