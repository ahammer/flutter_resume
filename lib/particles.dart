import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_flutter/widgets/animated_painter.dart';

final random = Random();
const maxSize = 2000.0;

class Particle {
  double x, y, xs, ys;

  final r1 = random.nextDouble();
  final r2 = random.nextDouble();
  final r3 = random.nextDouble();
  final r4 = random.nextDouble();

  double size;
  double maxAge;
  double age;
  final color = Colors.blueAccent;

  Particle() {
    randomize(5000, 5000, firstBuild: true);
  }

  void randomize(double width, double height, {bool firstBuild = false}) {
    x = random.nextDouble() * width;
    y = random.nextDouble() * height;
    xs = (random.nextDouble() - 0.5) * 0.05;
    ys = (random.nextDouble() - 0.5) * 0.05;

    size = random.nextDouble() * maxSize;
    age = 0;
    maxAge = random.nextDouble() * 5 + 25;
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

  Particles({count = 25}) {
    for (int i = 0; i < count; i++) {
      particles.add(Particle());
      particles[i].age = random.nextDouble() * particles[i].maxAge;
    }
  }
}

class ParticlePainter extends CustomPainter {
  final Particles particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    particles.particles.forEach((p) {
      double ageRemaining = 1 - (p.age / p.maxAge);
      if (ageRemaining > 0) {
        final size = p.size  * ((p.r1 < 0.5)?ageRemaining:(1-ageRemaining));
        double opacity = (ageRemaining > 0.8)
            ? 1 - ((ageRemaining - 0.8) * 5)
            : ageRemaining * 1.25;
        opacity /= 2.0;
        canvas.drawRect(
            Rect.fromCircle(center: Offset(p.x, p.y), radius: size),
            Paint()
              ..isAntiAlias = false
              ..color = p.color.withOpacity(opacity)
              ..style = PaintingStyle.stroke
              ..strokeWidth = p.size / 50 + 5
            /*
              ..shader = SweepGradient(center: FractionalOffset.center,
              startAngle: 0.0,
              endAngle: pi * 2,

                colors: <Color>[
                  p.color.withOpacity(.8),
                  p.color.withOpacity(0),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ).createShader(Rect.fromCenter(
                  center: Offset(p.x, p.y), width: size, height: size))*/
            );
      }
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void step(double frameTime, Size size) {
    particles.particles.forEach((p) {
      p.step(frameTime / 2, size);
    });
  }
}

/** Shader for paint
   ..shader = RadialGradient(
                colors: <Color>[
                  p.color.withOpacity(.8),
                  p.color.withOpacity(0),
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ).createShader(Rect.fromCenter(
                  center: Offset(p.x, p.y), width: size, height: size))
 */

class ParticlesAnimation extends AnimatedPainter {
  ParticlePainter painter = ParticlePainter(Particles());
  Size size;

  @override
  void paint(Canvas canvas, Size size) {
    this.size = size;
    painter.paint(canvas, size);
  }

  @override
  void step(double frameTime) {
    if (size != null) {
      painter.step(frameTime, size);
    }
  }
}

final kParticlesAnimation = ParticlesAnimation();
