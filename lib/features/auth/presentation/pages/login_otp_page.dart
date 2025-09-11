

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/shared/back_button_circle.dart';
import '../../../../core/shared/button_widget.dart';
import '../../../../core/shared/text_widget.dart';

class LoginOtpPage extends StatefulWidget {
  const LoginOtpPage({super.key});

  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
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
                          text: 'SMS kodni kiriting',
                        ),
                      ),
                      Text(
                          'Kod 94 434 43 06 nomeriga jo’natildi', style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 92.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: PinCodeTextField(
                          textStyle: TextStyle(fontSize: 36),
                          appContext: context,
                          length: 4,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            borderWidth: 0,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(25.r),
                            fieldHeight: 70,
                            fieldWidth: 68,
                            activeColor: Colors.transparent,
                            inactiveColor: AppColors.cxF5F6F9,
                            selectedColor: AppColors.cx43C19F,
                            activeFillColor: AppColors.cxF5F6F9,
                            inactiveFillColor: AppColors.cxF5F6F9,
                            selectedFillColor: AppColors.cxF5F6F9
                          ),
                          keyboardType: TextInputType.number,
                          enableActiveFill: true,

                        ),
                      ),
                      SizedBox(
                        height: 66.h,
                      ),
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
                    ],
                  ),
                ),
              ),
              // Button at the bottom
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: ButtonWidget(text: 'Keyingisiga o\'tish', onPressed: (){
                  context.push(AppRoutes.login);
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
