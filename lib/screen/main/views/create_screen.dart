import 'package:flutter/widgets.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: const Center(child: Text('Create', style: TextStyle(color: Color(0xFF000000)),)),
    );
  }
}
