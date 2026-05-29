import 'package:flutter/cupertino.dart';

class ContainerBackground extends StatelessWidget {
  final Widget? child;

  const ContainerBackground({
    super.key,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFBFE3F4), // Light Blue
              Color(0xFF1FC7FF), // Regular Blue
            ],
          ),
        ),
        child: child
      ),
    );
  }

}