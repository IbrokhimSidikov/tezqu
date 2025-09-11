

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:tezqu/core/shared/button_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_style.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/shared/back_button_circle.dart';
import '../../../../core/shared/text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cxWhite,
      appBar: AppBar(
        leadingWidth: 70,
        backgroundColor: AppColors.cxWhite,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: BackButtonCircle(
            onPressed: GoRouter.of(context).pop,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(AppImages.iconBlack),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        SizedBox(height: 36.h,),
                        Center(
                          child: TextWidget(
                            text: 'Xush kelibsiz',
                          ),
                        ),
                        SizedBox(height: 32.h,),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Text(
                             'Telefon nomer', style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              ),
                            ),
                        ),
                        AppTextField(
                          obscureText: false,
                          prefixText: '+998 ',
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(9), // Only 9 digits after +998
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Telefon raqamni kiriting';
                            }
                            if (value.length < 9) {
                              return 'Telefon raqam kamida 9 ta raqamdan iborat bo\'lishi kerak';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Sms kodni kiriting', style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                        ),
                        AppTextField(obscureText: true,),
                        SizedBox(height: 40.h),
                        InkWell(
                          onTap: () {
                          },
                          borderRadius: BorderRadius.circular(8.r),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            child: Text(
                              "Kodni qayta olish", 
                              style: TextStyle(
                                fontWeight: FontWeight.w500, 
                                color: AppColors.cx43C19F, 
                                fontSize: 20.sp,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.cx43C19F,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 120.h),
                        InkWell(
                          onTap: () {
                          },
                          borderRadius: BorderRadius.circular(8.r),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            child: Text(
                              "Ro'yxatdan o'tish", 
                              style: TextStyle(
                                fontWeight: FontWeight.w500, 
                                color: AppColors.cx43C19F,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.cx43C19F,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Button at the bottom
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: ButtonWidget(text: 'Dasturga kirish', onPressed: (){
                    context.push(AppRoutes.home);
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}




