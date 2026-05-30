import 'package:flutter/widgets.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration;

  SlideRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 150),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: duration,
         reverseTransitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           // Incoming screen slides in from right to left
           final incomingTween =
               Tween<Offset>(
                 begin: const Offset(-1.0, 0.0),
                 end: Offset.zero,
               ).animate(
                 CurvedAnimation(parent: animation, curve: Curves.easeInOut),
               );

           // Outgoing screen slides out from left to right
           final outgoingTween =
               Tween<Offset>(
                 begin: Offset.zero,
                 end: const Offset(-1.0, 0.0),
               ).animate(
                 CurvedAnimation(
                   parent: secondaryAnimation,
                   curve: Curves.easeInOut,
                 ),
               );

           return SlideTransition(
             position: incomingTween,
             child: SlideTransition(position: outgoingTween, child: child),
           );
         },
       );
}
