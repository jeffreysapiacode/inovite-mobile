import 'package:flutter/widgets.dart';
import 'dart:math' as math;

void main() {
  runApp(
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
        child: Center(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 300.0, left: 100.0), // Adjust offset as needed
                    child: Transform.rotate(
                      angle: 13 * (math.pi / 180), // Converts 13 degrees to radians
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7FF61),
                          borderRadius: BorderRadius.circular(40),
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150.0, right: 30.0), // Adjust offset as needed
                    child: Transform.rotate(
                      angle: -10 * (math.pi / 180), // Converts 13 degrees to radians
                      child: Container(
                        width: 175,
                        height: 175,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5DE4B),
                          borderRadius: BorderRadius.circular(40),
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
                          borderRadius: BorderRadius.circular(40),
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0, right: 0.0), // Adjust offset as needed
                    child: Transform.rotate(
                      angle: 0 * (math.pi / 180), // Converts 13 degrees to radians
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: const Color(0xFF27403D),
                          borderRadius: BorderRadius.circular(40),
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
              ],
            )),
      ),
    ),
  );
}