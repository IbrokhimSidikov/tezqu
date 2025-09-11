import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/shared/back_button_circle.dart';
import '../../../../core/shared/button_widget.dart';
import '../../../../core/shared/text_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      filled: true,
      fillColor:AppColors.cxF5F7F9,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: BorderSide.none,
      ),
    );


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
          padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      SizedBox(height: 36.h,),
                      Center(
                        child: Text(
                          'Ro\'yxatdan o\'tish',
                          style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      32.verticalSpace,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ism', style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                      AppTextField(obscureText: false, hint: 'Ismingizni kiriting',),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Familiya', style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                      AppTextField(obscureText: false, hint: 'Familiyangizni kiriting',),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tug\'ulgan sana', style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10.h,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                                    hintText: '12.03.1999',
                                    hintStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.cxAFB1B1),
                                    filled: true,
                                    fillColor: AppColors.cxF5F7F9,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.r),
                                      borderSide: BorderSide.none,
                                    ),
                                  )
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 21.w,),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jinsi', style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                ),
                                SizedBox(height: 10.h,),
                                DropdownButtonFormField<String>(
                                  borderRadius: BorderRadius.circular(30.r),
                                  iconSize: 25.sp,
                                  dropdownColor: AppColors.cxWhite,
                                  value: _selectedGender,
                                  decoration: inputDecoration,
                                  items: const [
                                    DropdownMenuItem(
                                        value: "Erkak", child: Text("Erkak")),
                                    DropdownMenuItem(
                                        value: "Ayol", child: Text("Ayol")),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: ButtonWidget(text: 'Keyingisiga o\'tish', onPressed: (){
                  context.push(AppRoutes.loginOtp);
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
