import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovite_mobile/screen/main/views/concepts_screen.dart';
import 'package:inovite_mobile/screen/main/views/explore_screen.dart';
import 'package:inovite_mobile/screen/main/views/teams_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    ExploreScreen(),
    ConceptsScreen(),
    TeamsScreen()
  ];

  void onNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
                  color: const Color(0xFFB5E1F5)
                ),

                // --- MAIN CONTENT ---
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(-2.0, 0.0),
                              end: Offset.zero,
                            ).animate(
                                CurvedAnimation(parent: animation, curve: Curves.easeInOut)
                            ),
                            child: child
                          );
                        },
                    child: KeyedSubtree(
                      key: ValueKey<int>(currentIndex),
                      child: screens[currentIndex],
                    ),
                  ),
                ),

                // --- FOOTER ---
                Container(
                  height: 77,
                  color: const Color(0xFF29CAFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => onNavTap(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/img/svg/navigation-explore-icon.svg',
                              // width: 40,
                              height: 40,
                              semanticsLabel: 'Explore',
                              colorFilter: ColorFilter.mode(
                                  currentIndex == 0 ? const Color(0xFFF8FF37): const Color(0xFFFFFFFF),
                                BlendMode.srcIn,
                              )
                            ),
                            Text(
                              'Explore',
                              style: GoogleFonts.freckleFace(
                                  fontSize: 20,
                                  color: currentIndex == 0 ? const Color(0xFFF8FF37): const Color(0xFFFFFFFF)
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onNavTap(1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/img/svg/navigation-concepts-icon.svg',
                              // width: 40,
                              height: 40,
                              semanticsLabel: 'Concepts',
                              colorFilter: ColorFilter.mode(
                                currentIndex == 1 ? const Color(0xFFF8FF37): const Color(0xFFFFFFFF),
                                BlendMode.srcIn,
                              )
                            ),
                            Text(
                              'Concepts',
                              style: GoogleFonts.freckleFace(
                                  fontSize: 20,
                                  color: currentIndex == 1 ? const Color(0xFFF8FF37): const Color(0xFFFFFFFF)
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onNavTap(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/img/svg/navigation-teams-icon.svg',
                              // width: 40,
                              height: 40,
                              semanticsLabel: 'Teams',
                              colorFilter: ColorFilter.mode(
                                currentIndex == 2 ? const Color(0xFFF8FF37): const Color(0xFFFFFFFF),
                                BlendMode.srcIn,
                              )
                            ),
                            Text(
                              'Teams',
                              style: GoogleFonts.freckleFace(
                                  fontSize: 20,
                                  color: currentIndex == 2 ? const Color(0xFFF8FF37): const Color(0xFFFFFFFF)
                              ),
                            ),
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
