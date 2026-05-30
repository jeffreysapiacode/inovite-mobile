import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/text_box.dart';
import '../../../core/widgets/colored_square.dart';
import '../../../core/widgets/container_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 420.0, right: 170.0),
                  child: SvgPicture.asset(
                    'assets/img/svg/login-back-button.svg',
                    width: 85,
                    // height: 100,
                    semanticsLabel: 'Back',
                  ),
                ),
              ),
            ),
            // Blue Square
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 300.0, left: 150.0),
                child: ColoredSquare(
                  rotate: 30,
                  width: 180,
                  height: 180,
                  color: const Color(0xFF2D9BEF),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            // White Square
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 330.0, left: 50.0),
                child: ColoredSquare(
                  rotate: -60,
                  width: 250,
                  height: 250,
                  color: const Color(0xFFEAFAFC),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            // Ice Blue Square
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0, right: 100.0),
                child: ColoredSquare(
                  rotate: -14,
                  width: 190,
                  height: 190,
                  color: const Color(0xFFBFF8FF),
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
                        textColor: const Color(0xFF1BB0E2),
                        borderColor: const Color(0xFFB8DAF1),
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
                // Password Text Box
                Center(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                      child: TextBox(
                        textColor: const Color(0xFF1BB0E2),
                        borderColor: const Color(0xFFB8DAF1),
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
                      label: 'login',
                      labelColor: Color(0xFF11B7FE),
                      onTap: () {
                        print('Login Pressed!');
                      },
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
