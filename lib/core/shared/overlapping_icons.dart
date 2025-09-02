

import 'package:flutter/cupertino.dart';

class OverlappingIcons extends StatelessWidget {
  final List<Widget> icons;

  const OverlappingIcons({super.key, required this.icons});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        children: List.generate(icons.length, (index) {
          return Positioned(
            left: index * 30.0,
            child: icons[index],
          );
        }),
      ),
    );
  }
}
