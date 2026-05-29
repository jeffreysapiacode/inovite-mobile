import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/text_box.dart';
import '../../../core/widgets/colored_square.dart';
import '../../../core/widgets/container_background.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Tapped Outside');
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: ContainerBackground(
        child: Stack(
          children: [
            // Back Button
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => print('Back Pressed'),
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
                // Email Text Box
                Center(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 15.0),
                      child: TextBox(
                        placeholderText: 'email',
                        isPassword: false,
                        type: TextInputType.emailAddress,
                        onChanged: (text) {
                          print('Parent received change: $text');
                        },
                        onSubmitted: (text) {
                          print('Parent received submit: $text');
                        },
                      ),
                    ),
                  ),
                ),
                // Display Name Text Box
                Center(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 15.0),
                      child: TextBox(
                        placeholderText: 'name',
                        isPassword: false,
                        type: TextInputType.name,
                        onChanged: (text) {
                          print('Parent received change: $text');
                        },
                        onSubmitted: (text) {
                          print('Parent received submit: $text');
                        },
                      ),
                    ),
                  ),
                ),
                // Password Text Box
                Center(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                      child: TextBox(
                        placeholderText: 'password',
                        isPassword: true,
                        type: TextInputType.text,
                        onChanged: (text) {
                          print('Parent received change: $text');
                        },
                        onSubmitted: (text) {
                          print('Parent received submit: $text');
                        },
                      ),
                    ),
                  ),
                ),
                // Sign Up Submit Button
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 22.0),
                    child: Button(
                      label: 'signup',
                      labelColor: Color(0xFF7253D0),
                      onTap: () {
                        print('Signup Pressed!');
                      }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
