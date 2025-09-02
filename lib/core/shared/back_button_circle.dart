import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../constants/app_colors.dart'; // for arrow-left

class BackButtonCircle extends StatelessWidget {
  const BackButtonCircle({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 53,
      height: 53,
      child: CupertinoButton(
        padding: EdgeInsets.all(0),
        borderRadius: BorderRadius.circular(30),
        color: AppColors.cxF5F7F9,
        onPressed: onPressed, // light background (like your image)
        child: Iconify(
          Tabler.arrow_left,
          size: 30,
          color: AppColors.cxBlack,
        ),
      ),
    );
  }
}
