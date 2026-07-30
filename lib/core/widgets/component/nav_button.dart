import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButton extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String filename;
  final String label;

  const NavButton({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.filename,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0), // Space inside the container
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/img/svg/${filename}.svg',
          // width: 40,
          height: 40,
          semanticsLabel: label,
          colorFilter: ColorFilter.mode(
            currentIndex == index
                ? const Color(0xFFF8FF37)
                : const Color(0xFFFFFFFF),
            BlendMode.srcIn,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.freeman(
            fontSize: 19,
            color: currentIndex == index
                ? const Color(0xFFF8FF37)
                : const Color(0xFFFFFFFF),
          ),
        ),
      ],
    ),
    );
  }
}
