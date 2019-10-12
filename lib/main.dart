import 'package:flutter/material.dart';
import 'package:resume_flutter/screens/about/about_screen.dart';
import 'package:resume_flutter/theme.dart';

void main() => runApp(MyApp());

const kSections = ["About", "Resume"];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentTheme = "Light";
  String currentSection = "About";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Adam Hammer',
        debugShowCheckedModeBanner: false,
        theme: getTheme(currentTheme),
        home: Scaffold(
            appBar: AppBar(
              title: MainScreenNavBar(
                  selected: currentSection,
                  onClick: (section) {
                    setState(() {
                      currentSection = section;
                    });
                  }),
              actions: <Widget>[
                Container(
                  height: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: DropdownButton(
                          value: currentTheme,
                          icon: Icon(Icons.settings_brightness),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (value) {
                            setState(() {
                              currentTheme = value;
                            });
                          },
                          items: ["Light", "Dark"]
                              .map((val) => DropdownMenuItem<String>(
                                  value: val,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(val),
                                  )))
                              .toList()),
                    ),
                  ),
                )
              ],
            ),
            body: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: getTheme(currentTheme),
                home: AboutScreen())));
  }
}

class MainScreenNavBar extends StatelessWidget {
  final Function(String) onClick;
  final String selected;

  const MainScreenNavBar({
    Key key,
    @required this.onClick,
    @required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ...kSections.map((hobby) => Container(
              child: RaisedButton(
                  color: (selected == hobby)
                      ? Theme.of(context).chipTheme.selectedColor
                      : Theme.of(context).chipTheme.disabledColor,
                  child: Text(
                    hobby,
                    style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () => onClick(hobby)),
            )),
      ],
    );
  }
}
