import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppBanner extends StatelessWidget {
  final String image;
  
  const AppBanner({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.cxDADADA,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: SizedBox(
        width: 361.w,
        height: 180.h,
        child: Image.asset(image),
      ),
    );
  }
}
