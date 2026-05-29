import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBox extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const TextBox({
    super.key,
    this.onChanged,
    this.onSubmitted
  });

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFD1D4F5), width: 4),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: EditableText(
        controller: _controller,
        focusNode: _focusNode,
        style: GoogleFonts.fredoka(
          color: Color(0xFF7253D0),
          fontSize: 24,
          // Reduced slightly to fit 35px height comfortably
          fontWeight: FontWeight.w600,
        ),
        cursorColor: Color(0xFF0000FF),
        backgroundCursorColor: Color(0xFFCCCCCC),
        // Customizing how text selection handles (magnifier, copy/paste)
        selectionColor: Color(0x4C0000FF),
        keyboardType: TextInputType.text,
        autocorrect: false,
        // Limit to alphanumeric characters and spaces
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
        ],
        onChanged: (String newText) {
          if (widget.onChanged != null) {
            widget.onChanged!(newText);
          }
        },
        onSubmitted: (String submittedText) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          if (widget.onSubmitted != null) {
            widget.onSubmitted!(submittedText);
          }
        },
      ),
    );
  }
}
