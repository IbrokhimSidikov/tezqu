

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../constants/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, this.onPressed, this.isLoading = false});
  final String text;
  final Function()? onPressed;
  final bool isLoading;


  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      borderRadius: BorderRadius.circular(30.r),
      color: AppColors.cx292B2F,
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 21.sp,
              width: 21.sp,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Iconify( Tabler.arrow_right, size: 21.sp, color: Colors.white,),
                SizedBox(width: 3.w,),
                Text(text),
              ],
            ),
    );
  }
}
