import 'package:flutter/material.dart';
import 'dart:math' as math;


class SpinningHexagonIcon extends StatefulWidget {
  final double size;
  final Color borderColor;
  final double borderWidth;

  const SpinningHexagonIcon({
    Key? key,
    this.size = 48.0,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
  }) : super(key: key);

  @override
  _SpinningHexagonIconState createState() => _SpinningHexagonIconState();
}

class _SpinningHexagonIconState extends State<SpinningHexagonIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
  AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: RotationTransition(
        turns: _animationController,
        child: CustomPaint(
          painter: HexagonPainter(
            context,
            borderColor: widget.borderColor,
            borderWidth: widget.borderWidth,
          ),
        ),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final BuildContext context;
  final Color borderColor;
  final double borderWidth;

  HexagonPainter(
      this.context, {
        required this.borderColor,
        required this.borderWidth,
      });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final sides = 6;
    final angle = math.pi * 2 / sides;
    final path = Path();
    path.moveTo(centerX + radius * math.cos(0.0), centerY + radius * math.sin(0.0));
    for (int i = 1; i <= sides; i++) {
      path.lineTo(centerX + radius * math.cos(angle * i), centerY + radius * math.sin(angle * i));
    }
    path.close();

    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(HexagonPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth;
  }
}
