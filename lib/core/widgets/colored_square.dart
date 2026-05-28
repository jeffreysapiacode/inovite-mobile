import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ColoredSquare extends StatelessWidget {

  final rotate;
  final width;
  final height;
  final color;
  final borderRadius;

  const ColoredSquare({
    super.key,
    required this.rotate,
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate * (math.pi / 180),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        ),
      ),
    );
  }
}