import 'package:flutter/widgets.dart';
import 'package:inovite_mobile/features/screens/auth/login_screen.dart';
import 'package:inovite_mobile/features/screens/auth/signup_screen.dart';
import 'package:inovite_mobile/features/screens/auth/welcome_screen.dart';

void main() {
  runApp(Inovite());
}

class Inovite extends StatelessWidget {
  const Inovite({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF000000), // Required root app identifier color
      // Tell WidgetsApp how to generate route pages natively
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return PageRouteBuilder<T>(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Supply a native core animation (e.g., Fade)
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
      home: const WelcomeScreen(),
    );
  }
}
