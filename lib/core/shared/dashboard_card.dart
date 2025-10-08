import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> icons;
  final VoidCallback? onTap;

  const DashboardCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icons,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 172.w,
        height: 126.h,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.cxF7F6F9,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                )),
            if (subtitle != null) ...[
              SizedBox(height: 4.h),
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.cxAFB1B1,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            const Spacer(),
            Row(
              children: icons,
            ),
          ],
        ),
      ),
    );
  }
}
