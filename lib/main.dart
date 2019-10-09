import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black,
          textTheme: TextTheme(
              display1: TextStyle(
                  fontFamily: "Helvetica",
                  color: Colors.white54,
                  shadows: [
                    Shadow(
                        color: Colors.black45,
                        offset: Offset(4, 4),
                        blurRadius: 4)
                  ]),
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
  double time;
  double width = 100;
  //Outputs to be used by the graphics engine
  double o1, o2, o3, o4, o5, o6, o7, o8;
  int selected = -1;

  @override
  void initState() {
    ticker = createTicker((duration) {
      setState(() {
        time = (DateTime.now().millisecondsSinceEpoch) / 1000.0;
        o1 = cos(time);
        o2 = sin(time * 1.1);
        o3 = cos(-time * 1.2);
        o4 = sin(-time * 1.3);
        o5 = cos(time / 5);
        o6 = sin(time / 5.5);
        o7 = cos(-time / 6);
        o8 = sin(-time / 7);
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
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: BackgroundPainter(this),
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(flex: 25, child: Container()),
                  Text("Adam Hammer",
                      style: Theme.of(context).textTheme.display3),
                  Text("Developer",
                      style: Theme.of(context).textTheme.display1),
                  Expanded(flex: 1, child: Container()),
                  Container(
                    height: 150,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 40, child: Container()),
                        buildButton(
                            index: 0, phase1: o1, phase2: o4, title: "About"),
                        Expanded(flex: 1, child: Container()),
                        buildButton(
                            index: 1, phase1: o2, phase2: o3, title: "Github"),
                        Expanded(flex: 1, child: Container()),
                        buildButton(
                            index: 2, phase1: o3, phase2: o2, title: "Resume"),
                        Expanded(flex: 1, child: Container()),
                        buildButton(
                            index: 3, phase1: o4, phase2: o1, title: "Contact"),
                        Expanded(flex: 40, child: Container()),
                      ],
                    ),
                  ),
                  Expanded(flex: 20, child: Container()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Listener buildButton(
      {@required int index,
      @required double phase1,
      @required double phase2,
      @required String title}) {
    var enabled = selected == index;
    return Listener(
      onPointerExit: (_) => selected = -1,
      onPointerEnter: (_) => selected = index,
      child: AnimatedContainer(
        width: (enabled) ? 200 : (selected == -1) ? width + phase1 * 10 : 100,
        height: (enabled) ? 100 : 50,
        decoration:
            (enabled) ? selectedHomeButtonDecoration : homeButtonDecoration,
        duration: Duration(milliseconds: 300),
        child: Center(
            child: Text(
          title,
          textScaleFactor: 1.3,
        )),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final _MyHomePageState state;

  BackgroundPainter(this.state);

  @override
  void paint(Canvas canvas, Size size) {
    final width = 600.0;
    final height = 300.0;

    drawCircle(
        canvas,
        size,
        width,
        height,
        Colors.red.withAlpha((state.o1 * 100 + 100).floor()),
        state.o1,
        state.o2,
        state.o5);

    drawCircle(
        canvas,
        size,
        width,
        height,
        Colors.green.withAlpha((state.o2 * 100 + 100).floor()),
        state.o6,
        state.o8,
        state.o5);

    drawCircle(
        canvas,
        size,
        width,
        height,
        Colors.blue.withAlpha((state.o3 * 100 + 100).floor()),
        state.o5,
        state.o6,
        state.o8);

    drawCircle(
        canvas,
        size,
        width,
        height,
        Colors.red.withAlpha((state.o4 * 100 + 100).floor()),
        state.o8,
        state.o1,
        state.o4);

    drawCircle(
        canvas,
        size,
        width,
        height,
        Colors.green.withAlpha((state.o5 * 100 + 100).floor()),
        state.o5,
        state.o7,
        state.o4);

    drawCircle(
        canvas, size, width, height, Colors.white.withAlpha(40), 0, 0, 0);
  }

  void drawCircle(Canvas canvas, Size size, double width, double height,
      Color color, double phase1, double phase2, double phase3) {
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(
                size.width / 2 + phase1 * 5, size.height / 2 + phase2 * 5),
            width: width,
            height: height),
        Paint()
          ..color = color
          ..blendMode = BlendMode.lighten);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

BoxDecoration homeButtonDecoration = BoxDecoration(
    color: Colors.deepOrange,
    border: Border.all(
      color: Colors.black54,
      width: 3,
    ),
    borderRadius: BorderRadius.circular(2));

BoxDecoration selectedHomeButtonDecoration = BoxDecoration(
    color: Colors.lightBlue,
    border: Border.all(
      color: Colors.black54,
      width: 3,
    ),
    boxShadow: [BoxShadow(blurRadius: 4, offset: Offset(2,2), color:  Colors.black)],
    borderRadius: BorderRadius.circular(8));
