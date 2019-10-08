import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
              display1:
                  TextStyle(fontFamily: "Helvetica", color: Colors.white54),
              display2: TextStyle(fontFamily: "Helvetica"),
              display3: TextStyle(
                fontFamily: "Helvetica",
                color: Colors.white,
              ),
              display4: TextStyle(fontFamily: "Helvetica"))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Ticker ticker;
  double width = 100;
  double o1, o2, o3, o4;
  int selected = -1;


  @override
  void initState() {
    ticker = createTicker((duration) {
      setState(() {
        double time = (DateTime.now().millisecondsSinceEpoch) / 1000.0;
        o1 = cos(time) * 10;
        o2 = sin(time) * 10;
        o3 = cos(-time) * 10;
        o4 = sin(-time) * 10;
      });
    });
    ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    ticker.stop();
    ticker.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(flex: 5, child: Container()),
              Text("Adam Hammer", style: Theme.of(context).textTheme.display3),
              Text("Developer", style: Theme.of(context).textTheme.display1),
              Expanded(flex: 1, child: Container()),
              Container(
                height: 150,
                child: Row(
                  children: <Widget>[
                    Expanded(flex: 40, child: Container()),
                    buildButton(index: 0, phase1: o1, phase2: o1, title: "About"),
                    Expanded(flex: 1, child: Container()),
                    buildButton(index: 1, phase1: o2, phase2: o2, title: "Github"),
                    Expanded(flex: 1, child: Container()),
                    buildButton(index: 2, phase1: o3, phase2: o3, title: "Resume"),
                    Expanded(flex: 1, child: Container()),
                    buildButton(index: 3, phase1: o4, phase2: o4, title: "Contact"),
                    Expanded(flex: 40, child: Container()),
                  ],
                ),
              ),
              Expanded(flex: 5, child: Container()),
            ],
          ),
        ),
      ),
    );
  }

  Listener buildButton({@required int index, @required double phase1, @required double phase2, @required String title}) {
    return Listener(
                    onPointerExit: (_) => selected = -1,
                    onPointerEnter: (_) => selected = index,
                                        child: AnimatedContainer(
                      width: (selected == index) ? 200 : (selected == -1) ? width + phase1 : 5,
                      height: (selected == index) ? 200 : 100 + phase2,
                      decoration: (selected == index)?selectedHomeButtonDecoration:homeButtonDecoration,
                      duration: Duration(milliseconds: 300),
                      child: Center(child: Text(title, textScaleFactor: 1.3,)),
                    ),
                  );
  }
}

BoxDecoration homeButtonDecoration = BoxDecoration(
    color: Colors.deepOrange,
    border: Border.all(
      color: Colors.black54,
      width: 3,
    ),
    borderRadius: BorderRadius.circular(8));


BoxDecoration selectedHomeButtonDecoration = BoxDecoration(
    color: Colors.lightBlue,
    border: Border.all(
      color: Colors.black54,
      width: 3,
    ),
    borderRadius: BorderRadius.circular(8));
