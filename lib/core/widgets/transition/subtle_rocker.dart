import 'dart:math';
import 'package:flutter/widgets.dart';

class SubtleRocker extends StatefulWidget {
  final Widget child;

  const SubtleRocker({super.key, required this.child});

  @override
  State<SubtleRocker> createState() => _SubtleRockerState();
}

class _SubtleRockerState extends State<SubtleRocker>
    with SingleTickerProviderStateMixin {
  int min = 2;
  int max = 7;
  late int randomValue = min + Random().nextInt((max - min) + 1);
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: randomValue), // Slow, subtle rocking
    vsync: this,
  )..repeat(reverse: true);

  // Rocks 0.05 radians (about 3 degrees) left and right
  final Tween<double> _tween = Tween(begin: -0.05, end: 0.05);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _tween.evaluate(_controller),
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}
