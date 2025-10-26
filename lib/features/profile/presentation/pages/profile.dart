import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/router/app_routes.dart';
import '../../../auth/data/models/user_model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserModel? _currentUser;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('CACHED_USER');
      
      if (userJson != null) {
        final userData = json.decode(userJson) as Map<String, dynamic>;
        setState(() {
          _currentUser = UserModel.fromJson(userData);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _showLogoutConfirmation() async {
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            'Ilovadan chiqish',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Haqiqatan ham ilovadan chiqmoqchimisiz?',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.cxAFB1B1,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Bekor qilish',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.cxAFB1B1,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Chiqish',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.cxF42800,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );

    if (shouldLogout == true) {
      await _handleLogout();
    }
  }

  Future<void> _handleLogout() async {
    try {
      // Get SharedPreferences instance
      final prefs = await SharedPreferences.getInstance();
      
      // Clear all stored data (tokens, user data, etc.)
      await prefs.clear();
      
      // Navigate to onboard page and remove all previous routes
      if (mounted) {
        context.go(AppRoutes.onboard);
      }
    } catch (e) {
      // Show error message if logout fails
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Xatolik yuz berdi: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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
            SizedBox(height: 16.h),

            _buildMenuItem(
              icon: Icons.exit_to_app,
              color: AppColors.cxF42800,
              iconColor: AppColors.cxWhite,
              title: "Ilovadan chiqish",
              onTap: _showLogoutConfirmation,
            ),

          ],
        ),
      )
    );
  }

  Widget _buildProfileHeader() {
    if (_isLoading) {
      return Row(
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundColor: AppColors.cxF5F7F9,
            child: CircularProgressIndicator(),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150.w,
                height: 20.h,
                color: AppColors.cxF5F7F9,
              ),
              SizedBox(height: 8.h),
              Container(
                width: 100.w,
                height: 16.h,
                color: AppColors.cxF5F7F9,
              ),
            ],
          ),
        ],
      );
    }

    final firstName = _currentUser?.firstName ?? '';
    final lastName = _currentUser?.lastName ?? '';
    final fullName = '$firstName $lastName'.trim();
    final displayName = fullName.isNotEmpty ? fullName : 'Foydalanuvchi';
    
    // Map role to Uzbek text
    String getRoleText(String? role) {
      switch (role?.toLowerCase()) {
        case 'customer':
          return 'Foydalanuvchi';
        case 'admin':
          return 'Administrator';
        case 'manager':
          return 'Menejer';
        default:
          return 'Foydalanuvchi';
      }
    }
    
    final roleText = getRoleText(_currentUser?.role);

    return Row(
      children: [
        Container(
          width: 70.r,
          height: 70.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFD4AF37), // Gold
                Color(0xFFFFD700), // Bright gold
                Color(0xFFFFA500), // Orange gold
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFD4AF37).withOpacity(0.3),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.person,
            size: 40.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              displayName,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.cxBlack,
              ),
            ),
            Text(
              roleText,
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
