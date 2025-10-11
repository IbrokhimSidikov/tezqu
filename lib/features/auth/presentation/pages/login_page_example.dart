import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tezqu/core/shared/button_widget.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/shared/back_button_circle.dart';
import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class LoginPageExample extends StatefulWidget {
  const LoginPageExample({super.key});

  @override
  State<LoginPageExample> createState() => _LoginPageExampleState();
}

class _LoginPageExampleState extends State<LoginPageExample> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : AppColors.cx43C19F,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
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
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              _showSnackBar(state.message ?? 'Muvaffaqiyatli!');
              // Navigate to home
              context.go(AppRoutes.home);
            } else if (state is AuthError) {
              _showSnackBar(state.message, isError: true);
            } else if (state is CodeSent) {
              _showSnackBar(state.message);
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;

            return SafeArea(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 10,
                            children: [
                              SizedBox(height: 36.h),
                              Center(
                                child: Text(
                                  'Xush kelibsiz',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 32.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Telefon nomer',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              AppTextField(
                                controller: _phoneController,
                                obscureText: false,
                                prefixText: '+998 ',
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(9),
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
                                  'Sms kodni kiriting',
                                  style: TextStyle(
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
                                onTap: isLoading
                                    ? null
                                    : () {
                                        if (_phoneController.text.isNotEmpty) {
                                          context.read<AuthCubit>().sendCode(
                                                phone: '+998${_phoneController.text}',
                                              );
                                        }
                                      },
                                borderRadius: BorderRadius.circular(8.r),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  child: Text(
                                    "Kodni qayta olish",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: isLoading
                                          ? Colors.grey
                                          : AppColors.cx43C19F,
                                      fontSize: 20.sp,
                                      decoration: TextDecoration.underline,
                                      decorationColor: isLoading
                                          ? Colors.grey
                                          : AppColors.cx43C19F,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 100.h),
                              InkWell(
                                onTap: () {
                                  context.push(AppRoutes.auth);
                                },
                                borderRadius: BorderRadius.circular(8.r),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
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
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : ButtonWidget(
                                text: 'Dasturga kirish',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthCubit>().login(
                                          phone: '+998${_phoneController.text}',
                                          code: _codeController.text,
                                        );
                                  }
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
