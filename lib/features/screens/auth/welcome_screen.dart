import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovite_mobile/core/widgets/colored_square.dart';

import '../../../core/widgets/button.dart';
import '../../../core/widgets/container_background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerBackground(
      child: Column(
        children: [
          // Graphics And Logo
          Stack(
            children: [
              // Yellow Square
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 100.0),
                  child: ColoredSquare(
                    rotate: 13,
                    width: 125,
                    height: 125,
                    color: const Color(0xFFF7FF61),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              // Orange Square
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 65.0, right: 30.0),
                  // Adjust offset as needed
                  child: ColoredSquare(
                    rotate: -10,
                    width: 175,
                    height: 175,
                    color: const Color(0xFFF5DE4B),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              // Green Square
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0, right: 40.0),
                  // Adjust offset as needed
                  child: ColoredSquare(
                    rotate: 30,
                    width: 300,
                    height: 300,
                    color: const Color(0xFFA2ED42),
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              // Dark Gray Square
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200.0, right: 0.0),
                  child: ColoredSquare(
                    rotate: 0,
                    width: 230,
                    height: 230,
                    color: const Color(0xFF27403D),
                    borderRadius: BorderRadius.circular(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SVG Logo
                        SvgPicture.asset(
                          'assets/img/svg/inovite-logo-bulb.svg',
                          width: 85,
                          // height: 100,
                          semanticsLabel: 'Inovite Bulb',
                        ),
                        SvgPicture.asset(
                          'assets/img/svg/inovite-logo-text.svg',
                          width: 160,
                          // height: 100,
                          semanticsLabel: 'Inovite Logo',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          // Login Button
          Button(label: 'login',
              labelColor: Color(0xFFD05353),
              onTap: () {
                print('Login Pressed!');
              }
          ),
          // Sign Up Button
          GestureDetector(
            onTap: () => print('Sign Up Pressed!'),
            child: Padding(
              padding: const EdgeInsets.only(top: 17.0, bottom: 22.0),
              child: Text(
                'sign up',
                style: GoogleFonts.fredoka(
                  color: Color(0xFFDDF4F6),
                  fontSize: 24,
                  // Reduced slightly to fit 35px height comfortably
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
