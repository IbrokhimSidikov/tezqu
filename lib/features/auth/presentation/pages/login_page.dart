import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:tezqu/core/shared/button_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_style.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/shared/back_button_circle.dart';
import '../../../../core/shared/text_widget.dart';
import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController(text: '+998 ');
  final _codeController = TextEditingController();
  bool _isCodeSent = false;

  @override
  void initState() {
    super.initState();
    // Set cursor position after the prefix
    _phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: _phoneController.text.length),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _sendLoginCode(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Extract only the digits from the phone number
      final phone = _phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
      context.read<AuthCubit>().sendLoginCode(phone: phone);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: Builder(
        builder: (context) => BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is CodeSent) {
            setState(() {
              _isCodeSent = true;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is AuthSuccess) {
            context.push(AppRoutes.home);
          }
        },
        child: Scaffold(
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
              child: Form(
                key: _formKey,
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
                              controller: _phoneController,
                              obscureText: false,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty || value == '+998 ') {
                                  return 'Telefon raqamni kiriting';
                                }
                                final digits = value.replaceAll(RegExp(r'[^0-9]'), '');
                                if (digits.length < 12) { // 998 + 9 digits
                                  return 'Telefon raqam kamida 9 ta raqamdan iborat bo\'lishi kerak';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                // Ensure the prefix is always present
                                if (!value.startsWith('+998 ')) {
                                  _phoneController.text = '+998 ';
                                  _phoneController.selection = TextSelection.fromPosition(
                                    TextPosition(offset: _phoneController.text.length),
                                  );
                                }
                              },
                            ),
                            if (_isCodeSent) ...[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Sms kodni kiriting', style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              AppTextField(
                                controller: _codeController,
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Kodni kiriting';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 40.h),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isCodeSent = false;
                                  });
                                  _sendLoginCode(context);
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
                            SizedBox(height: 100.h),
                            InkWell(
                              onTap: () {
                                context.push(AppRoutes.auth);
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
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final isLoading = state is AuthLoading;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: ButtonWidget(
                            text: _isCodeSent ? 'Dasturga kirish' : 'Kodni olish',
                            isLoading: isLoading,
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_isCodeSent) {
                                      // Login with code
                                      if (_formKey.currentState?.validate() ?? false) {
                                        // Extract only the digits from the phone number
                                        final phone = _phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
                                        final code = _codeController.text;
                                        context.read<AuthCubit>().login(
                                          phone: phone,
                                          code: code,
                                        );
                                      }
                                    } else {
                                      // Send code
                                      _sendLoginCode(context);
                                    }
                                  },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ),
      ),
    );
  }
}




