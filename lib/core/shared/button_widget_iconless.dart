

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../constants/app_colors.dart';

class ButtonWidgetIconless extends StatelessWidget {
  const ButtonWidgetIconless({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      borderRadius: BorderRadius.circular(30.r),
      color: AppColors.cx292B2F,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
        ],
      ),
    );
  }
}
