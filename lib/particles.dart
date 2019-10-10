import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const maxSize = 100.0;

class Particle {
  double x, y, xs, ys;

  final r1 = Random().nextDouble();
  final r2 = Random().nextDouble();
  final r3 = Random().nextDouble();
  final r4 = Random().nextDouble();

  double size;
  double maxAge;
  double age;
  final color = Color.fromARGB(255, 0, Random().nextInt(255), Random().nextInt(255));

  Particle() {
    randomize(10000, 10000);
  }

  void randomize(double width, double height) {
    x = Random().nextDouble() * width;
    y = Random().nextDouble() * height;
    xs = (Random().nextDouble() - 0.5);
    ys = (Random().nextDouble() - 0.5);
    if (Random().nextBool()) {
      xs = 0;
    } else {
      ys = 0;
    }
    size = Random().nextDouble() * maxSize + 100;
    age = 0;
    maxAge = Random().nextDouble() * 15000 + 2;

    if (Random().nextBool()) {
      if (xs > 0) {
        x = -maxSize / 2;
      } else {
        x = width + maxSize / 2;
      }
    } else {
      if (ys > 0) {
        y = -maxSize / 2;
      } else {
        y = height + maxSize / 2;
      }
    }
  }

  void step(double frameTime, Size size) {
    if (x > size.width + maxSize) {
      randomize(size.width, size.height);
    }
    if (y > size.height + maxSize) {
      randomize(size.width, size.height);
    }
    if (x < -maxSize) {
      randomize(size.width, size.height);
    }
    if (y < -maxSize) {}
    if (age > maxAge) {
      randomize(size.width, size.height);
    }

    age += frameTime;
    double ageRemaining = 1 - (age / maxAge);

    x += xs * frameTime * this.size * ageRemaining;
    y += ys * frameTime * this.size * ageRemaining;
  }
}

class Particles {
  List<Particle> particles = List();

  Particles({count = 1000}) {
    for (int i = 0; i < count; i++) {
      particles.add(Particle());
    }
  }
}

class ParticlePainter extends CustomPainter {
  final Particles particles;
  final double frameTime;

  ParticlePainter(this.particles, this.frameTime);

  @override
  void paint(Canvas canvas, Size size) {
    particles.particles.forEach((p) {
      p.step(frameTime, size);
      double ageRemaining = 1 - (p.age / p.maxAge);
      if (ageRemaining > 0) {
        final size = p.size * (ageRemaining) + 0.1;
        canvas.drawCircle(
            Offset(p.x, p.y),
            size,
            Paint()
              ..blendMode = BlendMode.lighten
              ..isAntiAlias = false
              ..shader = RadialGradient(
                colors: <Color>[
                  p.color.withOpacity(.2),
                  p.color.withOpacity(0),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ).createShader(Rect.fromCenter(
                  center: Offset(p.x, p.y), width: size, height: size)));
      }
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
