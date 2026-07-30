import 'package:flutter/widgets.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: const Center(child: Text('Explore', style: TextStyle(color: Color(0xFF000000)))),
    );
  }
}
