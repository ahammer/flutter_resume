import 'package:flutter/material.dart';

class AnimatedPaint extends StatefulWidget {
  final AnimatedPainter painter;

  const AnimatedPaint({Key key, @required this.painter}) : super(key: key);

  @override
  _AnimatedPainterState createState() => _AnimatedPainterState();
}

class _AnimatedPainterState extends State<AnimatedPaint>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double frameTime = DateTime.now().millisecondsSinceEpoch / 1000.0;
  double frameDelta;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: AnimatedBuilder(
            animation: Tween<double>(begin: 0, end: 1).animate(controller),
            builder: (BuildContext context, Widget child) {
              final newFrameTime =
                  DateTime.now().millisecondsSinceEpoch / 1000.0;
              frameDelta = newFrameTime - frameTime;
              frameTime = newFrameTime;
              widget.painter.step(frameDelta);
              return CustomPaint(painter: CustomPaintProxy(widget.painter));
            }));
  }
}

abstract class AnimatedPainter {
  void step(double frameTime);
  void paint(Canvas canvas, Size size);
}

class CustomPaintProxy extends CustomPainter {
  final AnimatedPainter painter;
  CustomPaintProxy(this.painter);

  @override
  void paint(Canvas canvas, Size size) {
    painter.paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
