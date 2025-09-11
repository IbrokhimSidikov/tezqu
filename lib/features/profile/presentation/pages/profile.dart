import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cxWhite,
      appBar: AppBar(
        backgroundColor: AppColors.cxWhite,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF5F7F9),
            ),
            child: IconButton(
              iconSize: 29.sp,
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          'Mening profilim',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500
          ),
        ),

      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            _buildProfileHeader(),
            SizedBox(height: 32.h),
            
            // Menu Items
            _buildMenuItem(
              icon: Icons.shield_moon_outlined,
              iconColor: AppColors.cxFFBCFA,
              color: AppColors.cxFFBCFA,
              title: "Kafil shaxs qo'shish",
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItem(
              icon: Icons.settings,
              iconColor: AppColors.cxFEDA84,
              color: AppColors.cxFEDA84,
              title: "Sozlamalar",
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItem(
              icon: Icons.headset_mic,
              color: AppColors.cx78D9BF,
              iconColor: AppColors.cx78D9BF,
              title: "Qo'llab quvvatlash xizmati",
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItem(
              icon: Icons.info,
              color: AppColors.cx292B2F,
              iconColor: AppColors.cx292B2F,
              title: "Dastur haqida",
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItem(
              icon: Icons.share,
              color: AppColors.cxD9D9D9,
              iconColor: AppColors.cxAFB1B1,
              title: "Ilovani ulashish",
              onTap: () {},
            ),
          ],
        ),
      )
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 35.r,
          backgroundImage: AssetImage(AppImages.ava1),
          backgroundColor: AppColors.cxF5F7F9,
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ibrokhim Siddikov',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.cxBlack,
              ),
            ),
            Text(
              'Foydalanuvchi',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.cxAFB1B1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: 54.w,
              height: 54.h,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 29.sp,
                color: iconColor == AppColors.cx292B2F ? AppColors.cxWhite :
                       iconColor == AppColors.cxAFB1B1 ? AppColors.cx292B2F : AppColors.cxBlack,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.cxBlack,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.sp,
              color: AppColors.cxAFB1B1,
            ),
          ],
        ),
      ),
    );
  }
}
