import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ColoredSquare extends StatelessWidget {
  final double rotate;
  final double width;
  final double height;
  final Color color;
  final BorderRadius borderRadius;
  final Widget? child;

  const ColoredSquare({
    super.key,
    required this.rotate,
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
    this.child
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
          borderRadius: borderRadius,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
