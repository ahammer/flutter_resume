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
  String selected;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - kSideNavWidth;
    

    return Stack(children: <Widget>[
      ContentPanel(opened: selected == "3D Printing", openOffset: kSideNavWidth-16.0,  closedOffset:-width - 16, width: width),
      ContentPanel(opened: selected == "Photography", openOffset: kSideNavWidth-16.0,  closedOffset:-width - 16, width: width),
      ContentPanel(opened: selected == "Robotics", openOffset: kSideNavWidth-16.0,  closedOffset:-width - 16, width: width),
      ContentPanel(opened: selected == "Gaming", openOffset: kSideNavWidth-16.0,  closedOffset:-width - 16, width: width),
      AboutScreenSidebar(onClick:toggleOpened),
    ]);
  }

  void toggleOpened(String button) {
    setState((){
      selected = button;
    });
  }
}

class ContentPanel extends StatelessWidget {
  const ContentPanel({
    Key key,
    @required this.opened,
    @required this.openOffset,
    @required this.closedOffset,
    @required this.width,
  }) : super(key: key);

  final bool opened;
  final double openOffset;
  final double closedOffset;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: AnimatedOpacity(
        curve: Curves.linearToEaseOut,
        duration: const Duration(milliseconds: 600),
        opacity: opened?1:0,
        
        child: AnimatedContainer(
          curve: Curves.linearToEaseOut,
            transform: Transform.translate(offset: Offset(opened?openOffset:closedOffset,0)).transform,
            duration: const Duration(milliseconds: 1200),
            width: width,
            height: double.infinity,
            color: Theme.of(context).colorScheme.surface),
      ),
    );
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
