import 'package:flutter/material.dart';
import 'package:resume_flutter/screens/about/about_screen.dart';
import 'package:resume_flutter/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String currentTheme = "Light";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adam Hammer',
      debugShowCheckedModeBanner: false,
      theme: getTheme(currentTheme),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Adam Hammer"),
            actions: <Widget>[
              DropdownButton(
                  value: currentTheme,
                  icon: Icon(Icons.settings_brightness),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (value){
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
                      .toList())
            ],
          ),
          body: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getTheme(currentTheme),
              home: AboutScreen())),
    );
  }
}
