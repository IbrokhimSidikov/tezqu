import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share_plus/share_plus.dart';

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
  String _selectedLanguage = 'uz';
  bool _isDarkMode = false;

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
      
      _selectedLanguage = prefs.getString('app_language') ?? 'uz';
      _isDarkMode = prefs.getBool('dark_mode') ?? false;
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

  void _showShareBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cxWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.cxD9D9D9,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Ilovani ulashish',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cxBlack,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Do\'stlaringiz bilan ulashing',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.cxAFB1B1,
                ),
              ),
              SizedBox(height: 24.h),
              _buildShareOption(
                icon: Icons.share,
                title: 'Umumiy ulashish',
                subtitle: 'Barcha ilovalar orqali ulashing',
                color: AppColors.cx78D9BF,
                onTap: () {
                  Navigator.pop(context);
                  _shareApp();
                },
              ),
              SizedBox(height: 12.h),
              _buildShareOption(
                icon: Icons.copy,
                title: 'Havolani nusxalash',
                subtitle: 'Ilovaga havolani nusxalash',
                color: AppColors.cxFEDA84,
                onTap: () {
                  Navigator.pop(context);
                  _copyAppLink();
                },
              ),
              SizedBox(height: 12.h),
              _buildShareOption(
                icon: Icons.phone_android,
                title: 'Play Store',
                subtitle: 'Google Play\'da ochish',
                color: Color(0xFF4CAF50),
                onTap: () {
                  Navigator.pop(context);
                  _openPlayStore();
                },
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> _shareApp() async {
    try {
      const String appName = 'TezQu';
      const String appDescription = 'TezQu - Biznesingizni boshqarish uchun eng yaxshi ilova!';
      const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.tezqu.app';
      
      final String shareText = '$appDescription\n\nIlovani yuklab olish:\n$playStoreUrl';
      
      await Share.share(
        shareText,
        subject: appName,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Xatolik yuz berdi'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _copyAppLink() async {
    try {
      const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.tezqu.app';
      
      await Clipboard.setData(ClipboardData(text: playStoreUrl));
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: AppColors.cxWhite),
                SizedBox(width: 12.w),
                Text('Havola nusxalandi!'),
              ],
            ),
            backgroundColor: AppColors.cx78D9BF,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Xatolik yuz berdi'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _openPlayStore() async {
    try {
      const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.tezqu.app';
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Play Store ochilmoqda...'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Xatolik yuz berdi'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showAboutBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cxWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.cxD9D9D9,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFD4AF37),
                        Color(0xFFFFD700),
                        Color(0xFFFFA500),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFD4AF37).withOpacity(0.3),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.business_center,
                    size: 40.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'TezQu',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Versiya 1.0.4 (5)',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.cxAFB1B1,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.cxF5F7F9,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    'TezQu - Biznesingizni boshqarish uchun eng yaxshi ilova. Mahsulotlar, xarajatlar va shartnomalarni oson boshqaring.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.cxBlack,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                _buildAboutInfoRow(
                  icon: Icons.developer_mode,
                  label: 'Ishlab chiqaruvchi',
                  value: 'Codenza Team',
                ),
                SizedBox(height: 12.h),
                _buildAboutInfoRow(
                  icon: Icons.calendar_today,
                  label: 'Chiqarilgan sana',
                  value: '2025',
                ),
                SizedBox(height: 12.h),
                _buildAboutInfoRow(
                  icon: Icons.security,
                  label: 'Litsenziya',
                  value: 'Proprietary',
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: _buildAboutActionButton(
                        icon: Icons.privacy_tip_outlined,
                        label: 'Maxfiylik',
                        onTap: () {
                          Navigator.pop(context);
                          _showPrivacyPolicy();
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _buildAboutActionButton(
                        icon: Icons.description_outlined,
                        label: 'Shartlar',
                        onTap: () {
                          Navigator.pop(context);
                          _showTermsOfService();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                _buildAboutActionButton(
                  icon: Icons.star_border,
                  label: 'Ilovani baholash',
                  onTap: () {
                    Navigator.pop(context);
                    _rateApp();
                  },
                ),
                SizedBox(height: 24.h),
                Text(
                  '© 2025 TezQu. Barcha huquqlar himoyalangan.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.cxAFB1B1,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPrivacyPolicy() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Maxfiylik siyosati ochilmoqda...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showTermsOfService() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Foydalanish shartlari ochilmoqda...'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _rateApp() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.star, color: AppColors.cxWhite),
            SizedBox(width: 12.w),
            Text('Baholash uchun rahmat!'),
          ],
        ),
        backgroundColor: AppColors.cx78D9BF,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showSettingsBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.cxWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: AppColors.cxD9D9D9,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Sozlamalar',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Ilovani sozlang',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  _buildSettingItem(
                    icon: Icons.language,
                    title: 'Til',
                    subtitle: _getLanguageName(_selectedLanguage),
                    color: AppColors.cxFEDA84,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _showLanguageSelector();
                    },
                  ),
                  SizedBox(height: 12.h),
                  _buildSettingItem(
                    icon: Icons.dark_mode,
                    title: 'Tungi rejim',
                    subtitle: _isDarkMode ? 'Yoqilgan' : 'O\'chirilgan',
                    color: AppColors.cx292B2F,
                    trailing: Switch(
                      value: _isDarkMode,
                      activeColor: AppColors.cx78D9BF,
                      onChanged: (value) async {
                        setModalState(() {
                          _isDarkMode = value;
                        });
                        setState(() {
                          _isDarkMode = value;
                        });
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('dark_mode', value);
                        
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                _isDarkMode
                                    ? 'Tungi rejim yoqildi'
                                    : 'Tungi rejim o\'chirildi',
                              ),
                              duration: Duration(seconds: 1),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    onTap: null,
                  ),
                  SizedBox(height: 12.h),
                  _buildSettingItem(
                    icon: Icons.notifications,
                    title: 'Bildirishnomalar',
                    subtitle: 'Barcha bildirishnomalar',
                    color: AppColors.cxFFBCFA,
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Bildirishnomalar sozlamalari'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

  String _getLanguageName(String code) {
    switch (code) {
      case 'uz':
        return 'O\'zbekcha';
      case 'ru':
        return 'Русский';
      case 'en':
        return 'English';
      default:
        return 'O\'zbekcha';
    }
  }

  void _showLanguageSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cxWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.cxD9D9D9,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Tilni tanlang',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cxBlack,
                ),
              ),
              SizedBox(height: 24.h),
              _buildLanguageOption('uz', 'O\'zbekcha', '🇺🇿'),
              SizedBox(height: 12.h),
              _buildLanguageOption('ru', 'Русский', '🇷🇺'),
              SizedBox(height: 12.h),
              _buildLanguageOption('en', 'English', '🇺🇸'),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String code, String name, String flag) {
    final isSelected = _selectedLanguage == code;
    return InkWell(
      onTap: () async {
        setState(() {
          _selectedLanguage = code;
        });
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('app_language', code);
        
        Navigator.pop(context);
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: AppColors.cxWhite),
                  SizedBox(width: 12.w),
                  Text('Til o\'zgartirildi: $name'),
                ],
              ),
              backgroundColor: AppColors.cx78D9BF,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.cx78D9BF.withOpacity(0.1) : AppColors.cxF5F7F9,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.cx78D9BF : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Text(
              flag,
              style: TextStyle(fontSize: 32.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: AppColors.cxBlack,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.cx78D9BF,
                size: 24.sp,
              ),
          ],
        ),
      ),
    );
  }

  void _showSupportBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.cxWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.cxD9D9D9,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: AppColors.cx78D9BF.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.headset_mic,
                  size: 35.sp,
                  color: AppColors.cx78D9BF,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Qo\'llab quvvatlash',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cxBlack,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Biz bilan bog\'laning',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.cxAFB1B1,
                ),
              ),
              SizedBox(height: 24.h),
              _buildSupportOption(
                icon: Icons.telegram,
                title: 'Telegram',
                subtitle: '@tezqu_support',
                color: Color(0xFF0088CC),
                onTap: () {
                  Navigator.pop(context);
                  _openTelegram();
                },
              ),
              SizedBox(height: 12.h),
              _buildSupportOption(
                icon: Icons.phone,
                title: 'Telefon',
                subtitle: '+998 90 123 45 67',
                color: AppColors.cx78D9BF,
                onTap: () {
                  Navigator.pop(context);
                  _callSupport();
                },
              ),
              SizedBox(height: 12.h),
              _buildSupportOption(
                icon: Icons.email,
                title: 'Email',
                subtitle: 'support@tezqu.uz',
                color: AppColors.cxFEDA84,
                onTap: () {
                  Navigator.pop(context);
                  _emailSupport();
                },
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.cxF5F7F9,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 20.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        'Ish vaqti: Dushanba-Juma, 9:00-18:00',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.cxAFB1B1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openTelegram() async {
    const telegramUrl = 'https://t.me/tezqu_support';
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.telegram, color: AppColors.cxWhite),
              SizedBox(width: 12.w),
              Text('Telegram ochilmoqda...'),
            ],
          ),
          backgroundColor: Color(0xFF0088CC),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _callSupport() async {
    const phoneNumber = 'tel:+998901234567';
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.phone, color: AppColors.cxWhite),
              SizedBox(width: 12.w),
              Text('Telefon ochilmoqda...'),
            ],
          ),
          backgroundColor: AppColors.cx78D9BF,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _emailSupport() async {
    const email = 'mailto:support@tezqu.uz';
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.email, color: AppColors.cxWhite),
              SizedBox(width: 12.w),
              Text('Email ochilmoqda...'),
            ],
          ),
          backgroundColor: AppColors.cxFEDA84,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Nusxalash',
            textColor: AppColors.cxWhite,
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: 'support@tezqu.uz'));
            },
          ),
        ),
      );
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
              onTap: _showSettingsBottomSheet,
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItem(
              icon: Icons.headset_mic,
              color: AppColors.cx78D9BF,
              iconColor: AppColors.cx78D9BF,
              title: "Qo'llab quvvatlash xizmati",
              onTap: _showSupportBottomSheet,
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItem(
              icon: Icons.info,
              color: AppColors.cx292B2F,
              iconColor: AppColors.cx292B2F,
              title: "Dastur haqida",
              onTap: _showAboutBottomSheet,
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItemWithBadge(
              icon: Icons.description_outlined,
              color: Color(0xFFFFB6C1),
              iconColor: AppColors.cxBlack,
              title: "Shartnomalarim",
              badgeCount: 1,
              onTap: () {
                context.push(AppRoutes.contracts);
              },
            ),
            SizedBox(height: 16.h),
            
            _buildMenuItem(
              icon: Icons.share,
              color: AppColors.cxD9D9D9,
              iconColor: AppColors.cxAFB1B1,
              title: "Ilovani ulashish",
              onTap: _showShareBottomSheet,
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

  Widget _buildMenuItemWithBadge({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
    required Color color,
    required int badgeCount,
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
            if (badgeCount > 0)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.cxF42800,
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(
                  minWidth: 24.w,
                  minHeight: 24.h,
                ),
                child: Center(
                  child: Text(
                    badgeCount.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxWhite,
                    ),
                  ),
                ),
              ),
            SizedBox(width: 8.w),
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

  Widget _buildShareOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.cxF5F7F9,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24.sp,
                color: color,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                  ),
                ],
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

  Widget _buildAboutInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cxF5F7F9,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: AppColors.cx292B2F,
          ),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.cxAFB1B1,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.cxBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.cxF5F7F9,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.cxD9D9D9,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18.sp,
              color: AppColors.cx292B2F,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.cxBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Widget trailing,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.cxF5F7F9,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24.sp,
                color: color,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                  ),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildSupportOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.cxF5F7F9,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24.sp,
                color: color,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                  ),
                ],
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
