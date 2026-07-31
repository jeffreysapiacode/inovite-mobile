import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final VoidCallback? onTap;

  const Button({super.key,
    required this.label,
    this.labelColor,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        // Sets width to 90% of the screen
        width: MediaQuery.of(context).size.width * 0.9,
        height: 70,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            label,
            style: GoogleFonts.fredoka(
              color: labelColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
