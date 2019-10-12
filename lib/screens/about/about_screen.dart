import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/secondary_screen.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SecondaryScreen(title: "About", body: AboutScreenBody());
}

const kHobbies = ["3D Printing", "Photography", "Robotics", "Gaming"];

class AboutScreenBody extends StatelessWidget {
  const AboutScreenBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      AboutScreenSidebar(),
      Container(width: 1),
      Expanded(child: Container(height: double.infinity)),
    ]);
  }
}

class AboutScreenSidebar extends StatelessWidget {
  const AboutScreenSidebar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
                        width:double.infinity,
                    child: RaisedButton(
                        child: Text(
                          hobby,
                          style: Theme.of(context).textTheme.button,
                        ),
                        onPressed: () {}),
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
