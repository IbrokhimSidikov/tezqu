import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      fontFamily: 'SFCompact'
    ),
    );
  }
}