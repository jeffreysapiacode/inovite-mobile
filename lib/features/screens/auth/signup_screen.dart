import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/colored_square.dart';
import '../../../core/widgets/container_background.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBackground(
      child: Stack(
        children: [
          // Back Button
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 400.0, right: 150.0),
              child: SvgPicture.asset(
                'assets/img/svg/signup-back-button.svg',
                width: 85,
                // height: 100,
                semanticsLabel: 'Back',
              )
            )
          ),
          // Pink Square
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 400.0, left: 150.0),
              child: ColoredSquare(
                rotate: 98,
                width: 150,
                height: 150,
                color: const Color(0xFFDC42ED),
                borderRadius: BorderRadius.circular(23),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
