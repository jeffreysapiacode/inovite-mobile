import 'package:flutter/widgets.dart';

class IdeaScreen extends StatelessWidget {
  const IdeaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: const Center(child: Text('Idea', style: TextStyle(color: Color(0xFF000000)),)),
    );
  }
}
