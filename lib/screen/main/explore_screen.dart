import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            color: const Color(0xFFF5F5F5),
            child: Column(
              children: [
                // --- HEADER ---
                Container(
                  height: 70,
                  color: const Color(0xFFB5E1F5),
                  child: const Center(
                    child: Text(
                      'Header Navigation',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),

                // --- MAIN CONTENT ---
                Expanded(
                  child: Container(
                    color: const Color(0xFFD5FF63),
                    child: const Center(child: Text('Main Body Content')),
                  ),
                ),

                // --- FOOTER ---
                Container(
                  height: 70,
                  color: const Color(0xFF29CAFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => print('Explore tapped'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/img/svg/navigation-explore-icon.svg',
                              // width: 40,
                              height: 40,
                              semanticsLabel: 'Explore',
                            ),
                            Text('Explore', style: GoogleFonts.freckleFace(
                                fontSize: 20
                            )),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print('Concepts tapped'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/img/svg/navigation-concepts-icon.svg',
                              // width: 40,
                              height: 40,
                              semanticsLabel: 'Concepts',
                            ),
                            Text('Concepts', style: GoogleFonts.freckleFace(
                                fontSize: 20
                            )),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print('Teams tapped'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/img/svg/navigation-teams-icon.svg',
                              // width: 40,
                              height: 40,
                              semanticsLabel: 'Teams',
                            ),
                            Text('Teams', style: GoogleFonts.freckleFace(
                                fontSize: 20
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
