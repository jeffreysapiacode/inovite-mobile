import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/colored_square.dart';
import '../../../core/widgets/container_background.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBackground(
      child: Stack(
        children: [
          // Back Button
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => print('Back Pressed!'),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 420.0, right: 170.0),
                child: SvgPicture.asset(
                  'assets/img/svg/signup-back-button.svg',
                  width: 85,
                  // height: 100,
                  semanticsLabel: 'Back',
                ),
              ),
            ),
          ),
          // Purple Square
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 0.0),
              child: ColoredSquare(
                rotate: 30,
                width: 280,
                height: 280,
                color: const Color(0xFFB65AFC),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
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
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          // Blue Square
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 500.0, left: 150.0),
              child: ColoredSquare(
                rotate: 98,
                width: 150,
                height: 150,
                color: const Color(0xFF4C8EFF),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          // Form Fields
          Column(
            children: [
              Spacer(),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFD1D4F5),
                        width: 4,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: EditableText(
                      controller: _textController,
                      // This is the required parameter
                      focusNode: FocusNode(),
                      style: const TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16.0,
                      ),
                      cursorColor: Color(0xFF0000FF),
                      backgroundCursorColor: Color(0xFFCCCCCC),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => print('Signup Pressed!'),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 22.0),
                    child: SizedBox(
                      // Sets width to 90% of the screen
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 55,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'signup',
                          style: GoogleFonts.fredoka(
                            color: Color(0xFF7253D0),
                            fontSize: 24,
                            // Reduced slightly to fit 35px height comfortably
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
