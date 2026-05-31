import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inovite_mobile/screen/main/views/concepts_screen.dart';
import 'package:inovite_mobile/screen/main/views/explore_screen.dart';
import 'package:inovite_mobile/screen/main/views/teams_screen.dart';

import '../../core/widgets/component/nav_button.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  bool rightShift = false;

  final List<Widget> screens = [
    ExploreScreen(),
    ConceptsScreen(),
    TeamsScreen(),
  ];

  void onNavTap(int index) {
    setState(() {
      rightShift = index > currentIndex;
      currentIndex = index;
      print('Set');
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
                Container(height: 70, color: const Color(0xFFB5E1F5)),

                // --- MAIN CONTENT ---
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    reverseDuration: const Duration(milliseconds: 20000),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: (rightShift)
                                      ? Offset(-1.0, 0.0)
                                      : Offset(1.0, 0.0),
                                  end: Offset.zero,
                                ).animate(
                                  CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.decelerate,
                                  ),
                                ),
                            child: child,
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
                        child: NavButton(
                          filename: 'navigation-explore-icon',
                          label: 'Explore',
                          index: 0,
                          currentIndex: currentIndex,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onNavTap(1),
                        child: NavButton(
                          filename: 'navigation-concepts-icon',
                          label: 'Concepts',
                          index: 1,
                          currentIndex: currentIndex,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => onNavTap(2),
                        child: NavButton(
                          filename: 'navigation-teams-icon',
                          label: 'Teams',
                          index: 2,
                          currentIndex: currentIndex,
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
