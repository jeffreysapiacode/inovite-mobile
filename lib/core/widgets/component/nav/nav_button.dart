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
      child: Stack(
        alignment: Alignment.center,
        children: [
          (currentIndex == index) ?
          Container(
            width: 70.0,
            height: 200.0,
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: const Color(0xFF000000),
              borderRadius: BorderRadius.circular(16.0), // Adjust corner roundness here
            ),
          ): Container(
            width: 70.0,
            height: 200.0,
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16.0), // Adjust corner roundness here
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/img/svg/${filename}.svg',
                // width: 40,
                height: 40,
                semanticsLabel: label,
                colorFilter: ColorFilter.mode(
                  (currentIndex == index)
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFF000000),
                  BlendMode.srcIn,
                ),
              ),
              (label != '')
                  ? Text(
                      label,
                      style: GoogleFonts.freeman(
                        fontSize: 19,
                        color: currentIndex == index
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF000000),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
