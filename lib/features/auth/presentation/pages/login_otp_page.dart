import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/shared/back_button_circle.dart';
import '../../../../core/shared/button_widget.dart';
import '../../../../core/shared/text_widget.dart';
import '../../../../core/services/firebase_messaging_service.dart';
import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class LoginOtpPage extends StatefulWidget {
  final String phoneNumber;
  
  const LoginOtpPage({super.key, required this.phoneNumber});

  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
  final _otpController = TextEditingController();
  String _otpCode = '';

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _handleVerify(BuildContext context) {
    if (_otpCode.length == 4) {
      context.read<AuthCubit>().verify(
        phone: widget.phoneNumber,
        code: _otpCode,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('4 raqamli kodni kiriting')),
      );
    }
  }

  String _formatPhoneNumber(String phone) {
    // Format 998XXXXXXXXX to 99 XXX XX XX
    if (phone.length >= 11) {
      return '${phone.substring(0, 2)} ${phone.substring(2, 5)} ${phone.substring(5, 7)} ${phone.substring(7, 9)}';
    }
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Muvaffaqiyatli')),
            );
            // Get FCM token and send to backend
            final fcmToken = await FirebaseMessagingService().getToken();
            if (fcmToken != null) {
              context.read<AuthCubit>().updateFcmToken(fcmToken);
            }
            context.go(AppRoutes.home);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;
          
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
                          'Kod ${_formatPhoneNumber(widget.phoneNumber)} nomeriga jo\'natildi', 
                          style: TextStyle(
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
                          controller: _otpController,
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
                          onChanged: (value) {
                            setState(() {
                              _otpCode = value;
                            });
                          },
                          onCompleted: (value) {
                            _otpCode = value;
                          },
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
                child: ButtonWidget(
                  text: isLoading ? 'Yuklanmoqda...' : 'Keyingisiga o\'tish',
                  onPressed: isLoading ? null : () => _handleVerify(context),
                ),
              ),
            ],
          ),
        ),
      ),
          );
        },
      ),
    );
  }
}
