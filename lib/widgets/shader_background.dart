import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ShaderBackground extends StatelessWidget {
  const ShaderBackground({
    super.key,
    required this.program,
    required this.stopwatch,
    required this.mousePosition,
  });

  final ui.FragmentProgram program;
  final Stopwatch stopwatch;
  final Offset mousePosition;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShaderPainter(program, stopwatch, mousePosition),
      size: Size.infinite,
    );
  }
}

class ShaderPainter extends CustomPainter {
  final ui.FragmentProgram program;
  final Stopwatch stopwatch;
  final Offset mousePosition;

  ShaderPainter(this.program, this.stopwatch, this.mousePosition) : super(repaint: _Ticker());

  @override
  void paint(Canvas canvas, Size size) {
    final shader = program.fragmentShader();
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, 1.0);
    shader.setFloat(3, stopwatch.elapsedMilliseconds / 1000.0);
    shader.setFloat(4, mousePosition.dx);
    shader.setFloat(5, size.height - mousePosition.dy);
    shader.setFloat(6, 0.0);
    shader.setFloat(7, 0.0);
    final paint = Paint()..shader = shader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant ShaderPainter oldDelegate) {
    return oldDelegate.mousePosition != mousePosition;
  }
}

class _Ticker extends ChangeNotifier {
  _Ticker() {
    Timer.periodic(const Duration(milliseconds: 16), (_) => notifyListeners());
  }
}