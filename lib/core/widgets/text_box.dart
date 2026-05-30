import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBox extends StatefulWidget {
  final bool isPassword;
  final TextInputType type;
  final String placeholderText;
  final Color borderColor;
  final Color textColor;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const TextBox({
    super.key,
    required this.isPassword,
    required this.type,
    required this.placeholderText,
    required this.borderColor,
    required this.textColor,
    this.onChanged,
    this.onSubmitted,
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
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: widget.borderColor, width: 4),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: EditableText(
              controller: _controller,
              focusNode: _focusNode,
              style: GoogleFonts.fredoka(
                color: widget.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: Color(0xFF0000FF),
              backgroundCursorColor: Color(0xFFCCCCCC),
              // Password Handling
              obscureText: widget.isPassword,
              obscuringCharacter: '•',
              // Customizing how text selection handles (magnifier, copy/paste)
              selectionColor: Color(0x4C0000FF),
              keyboardType: widget.type,
              autocorrect: false,
              enableSuggestions: false,
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
          ),
          // Placeholder Text
          ListenableBuilder(
            listenable: _controller,
            builder: (context, child) {
              if (_controller.text.isEmpty &&
                  widget.placeholderText.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    widget.placeholderText,
                    style: GoogleFonts.fredoka(
                      color: const Color(0xFF272923),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
