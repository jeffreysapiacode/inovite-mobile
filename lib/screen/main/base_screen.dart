import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inovite_mobile/screen/main/views/create_screen.dart';
import 'package:inovite_mobile/screen/main/views/idea_screen.dart';
import 'package:inovite_mobile/screen/main/views/explore_screen.dart';

import '../../core/widgets/component/nav/nav_button.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  Offset? offset;

  final List<Widget> screens = [ExploreScreen(), CreateScreen(), IdeaScreen()];

  void onNavTap(int index) {
    setState(() {
      currentIndex = index;
      switch (currentIndex) {
        case 0:
          offset = Offset(-1.0, 0.0);
          break;
        case 1:
          offset = Offset(0.0, -1.0);
          break;
        case 2:
          offset = Offset(1.0, 0.0);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Content
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            color: const Color(0xFFF5F5F5),
            child: Column(
              children: [
                // HEADER
                // Stack
                // // SVG Image of Radiator
                // // Row - Spaced between
                // Circle Container - White - Padding between button and radiator
                /////// User Button
                /////// Notification Button
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(height: 80, color: const Color(0xFFFFFFFF)),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: SvgPicture.asset(
                        'assets/img/svg/inovite-radiator.svg',
                        // width: 40,
                        height: 55,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/img/svg/inovite-logo-user-info.svg',
                            width: 90,
                            height: 90,
                          ),
                          SvgPicture.asset(
                            'assets/img/svg/inovite-notifications.svg',
                            width: 90,
                            height: 90,
                          )
                          // Container(
                          //   width: 65.0,
                          //   height: 65.0,
                          //   decoration: BoxDecoration(
                          //     color: const Color(0xFFFFFFFF),
                          //     shape: BoxShape.circle,
                          //     border: Border.all(
                          //       color: const Color(0xFF000000),
                          //       width: 5,
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   width: 65.0,
                          //   height: 65.0,
                          //   decoration: BoxDecoration(
                          //     color: const Color(0xFFFFFFFF),
                          //     shape: BoxShape.circle,
                          //     border: Border.all(
                          //       color: const Color(0xFF000000),
                          //       width: 5,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),

                // BODY
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    reverseDuration: const Duration(milliseconds: 20000),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: offset,
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

                // FOOTER
                Container(
                  height: 77,
                  color: const Color(0xFFFFFFFF),
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
                      SizedBox(
                        width: 2.0,
                        height: 50.0,
                        child: Container(color: Color(0xFF000000)),
                      ),
                      GestureDetector(
                        onTap: () => onNavTap(1),
                        child: NavButton(
                          filename: 'navigation-create-icon',
                          label: '',
                          index: 1,
                          currentIndex: currentIndex,
                        ),
                      ),
                      SizedBox(
                        width: 2.0,
                        height: 50.0,
                        child: Container(color: Color(0xFF000000)),
                      ),
                      GestureDetector(
                        onTap: () => onNavTap(2),
                        child: NavButton(
                          filename: 'navigation-idea-icon',
                          label: 'Ideas',
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
        // HEADER
        // Padding(
        //   padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       // USER BUTTON
        //       Container(
        //         height: 65,
        //         width: 65,
        //         decoration: BoxDecoration(
        //           color: Color(0xFF27403D),
        //           borderRadius: BorderRadius.circular(50),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Color(0xFF000000),
        //               blurRadius: 0.0,
        //               spreadRadius: 0.0,
        //               offset: const Offset(7, 7),
        //             ),
        //           ],
        //         ),
        //         child: Container(
        //           alignment: Alignment.center,
        //           child: SvgPicture.asset(
        //             'assets/img/svg/inovite-logo-bulb.svg',
        //             width: 28,
        //             semanticsLabel: 'Inovite',
        //             // colorFilter: ColorFilter.mode(
        //             //   const Color(0xFFFFFFFF),
        //             //   BlendMode.srcIn,
        //             // ),
        //           ),
        //         ),
        //       ),
        //       // User Button
        //       Container(
        //         height: 65,
        //         width: 65,
        //         decoration: BoxDecoration(
        //           color: Color(0xFF29B6F7),
        //           borderRadius: BorderRadius.circular(50),
        //           boxShadow: [
        //             BoxShadow(
        //               color: Color(0xFF000000),
        //               blurRadius: 0.0,
        //               spreadRadius: 0.0,
        //               offset: const Offset(7, 7),
        //             ),
        //           ],
        //         ),
        //         child: Container(
        //           alignment: Alignment.center,
        //           // Prevents the SVG from expanding to fill the entire container
        //           child: SvgPicture.asset(
        //             'assets/img/svg/inovite-agent-user.svg',
        //             semanticsLabel: 'User',
        //             colorFilter: ColorFilter.mode(
        //               const Color(0xFFFFFFFF),
        //               BlendMode.srcIn,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
