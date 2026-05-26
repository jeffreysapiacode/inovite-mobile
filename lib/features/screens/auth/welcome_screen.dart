import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Directionality(
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
          child: Column(children: [
            // Graphics And Logo
              Stack(
                  children: [
                    // Yellow Square
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 100.0),
                        child: Transform.rotate(
                          angle: 13 * (math.pi / 180),
                          child: Container(
                            width: 125,
                            height: 125,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7FF61),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF000000),
                                  offset: Offset(4, 4),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Orange Square
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 65.0, right: 30.0), // Adjust offset as needed
                        child: Transform.rotate(
                          angle: -10 * (math.pi / 180), // Set degrees in radians
                          child: Container(
                            width: 175,
                            height: 175,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5DE4B),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF000000),
                                  offset: Offset(-4, 4), // 4px x and 4px y
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Green Square
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 150.0, right: 40.0), // Adjust offset as needed
                        child: Transform.rotate(
                          angle: 30 * (math.pi / 180), // Converts 13 degrees to radians
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              color: const Color(0xFFA2ED42),
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF000000),
                                  offset: Offset(4, 4), // 4px x and 4px y
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Dark Gray Square
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200.0, right: 0.0), // Adjust offset as needed
                        child: Transform.rotate(
                          angle: 0 * (math.pi / 180), // Converts 13 degrees to radians
                          child: Container(
                            width: 230,
                            height: 230,
                            decoration: BoxDecoration(
                              color: const Color(0xFF27403D),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0xFF000000),
                                  offset: Offset(4, 4), // 4px x and 4px y
                                  blurRadius: 0,
                                ),
                              ],
                            ),
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
                              )
                            ],),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            // Login Button
            Spacer(),
            GestureDetector(
              onTap: () => print('Login Pressed!'),
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
                    'login',
                    style: GoogleFonts.fredoka(
                      color: Color(0xFFD05353),
                      fontSize: 24, // Reduced slightly to fit 35px height comfortably
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
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
                    fontSize: 24, // Reduced slightly to fit 35px height comfortably
                    fontWeight: FontWeight.w600,
                  ),
                )
              ),
            ),
          ],),
        ),
      );
  }
}