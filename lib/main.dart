import 'package:flutter/widgets.dart';
import '../../../../screen/auth/welcome_screen.dart';

void main() {
  runApp(Inovite());
}

class Inovite extends StatelessWidget {
  const Inovite({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF000000),
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return PageRouteBuilder<T>(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
      home: const WelcomeScreen(),
    );
  }
}
