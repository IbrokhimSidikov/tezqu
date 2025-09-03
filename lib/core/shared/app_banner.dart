import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    super.key,
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
      ),
    );
  }
}
