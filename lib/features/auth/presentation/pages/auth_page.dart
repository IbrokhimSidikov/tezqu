import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_textfield.dart';
import '../../../../core/shared/back_button_circle.dart';
import '../../../../core/shared/button_widget.dart';
import '../../../../core/shared/text_widget.dart';
import '../../../../core/utils/date_input_formatter.dart';
import '../../../../core/utils/phone_input_formatter.dart';
import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneController = TextEditingController(text: '+998 ');
  final _phoneFocusNode = FocusNode();
  final _dateFocusNode = FocusNode();
  String? _selectedGender;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dateOfBirthController.dispose();
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    _dateFocusNode.dispose();
    super.dispose();
  }

  void _handleRegister(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      // Extract only digits from the formatted phone number
      final phoneNumber = _phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
      
      // Convert date from DD.MM.YYYY to ISO 8601 format (YYYY-MM-DD)
      String? dateOfBirth;
      if (_dateOfBirthController.text.isNotEmpty) {
        dateOfBirth = _convertToISO8601(_dateOfBirthController.text);
        
        if (dateOfBirth == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Tug\'ulgan sanani to\'g\'ri formatda kiriting (DD.MM.YYYY)')),
          );
          return;
        }
      }
      
      context.read<AuthCubit>().register(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        dateOfBirth: dateOfBirth,
        gender: _selectedGender,
        phoneNumber: phoneNumber,
      );
    }
  }

  String? _convertToISO8601(String date) {
    try {
      // Expected format: DD.MM.YYYY
      final parts = date.split('.');
      if (parts.length != 3) return null;
      
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      
      // Validate date
      if (day < 1 || day > 31 || month < 1 || month > 12 || year < 1900) {
        return null;
      }
      
      // Return ISO 8601 format: YYYY-MM-DD
      return '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
    } catch (e) {
      return null;
    }
  }

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


    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Muvaffaqiyatli')),
            );
            // Pass phone number to OTP page
            final phoneNumber = _phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');
            context.push('${AppRoutes.loginOtp}?phone=$phoneNumber');
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
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(AppImages.iconBlack),
        ),
      ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
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
                        child: Text(
                          'Ro\'yxatdan o\'tish',
                          style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      32.verticalSpace,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ism *', style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                      // first_name
                      AppTextField(
                        controller: _firstNameController,
                        obscureText: false,
                        hint: 'Ismingizni kiriting',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ismingizni kiriting';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Familiya *', style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                      // last_name
                      AppTextField(
                        controller: _lastNameController,
                        obscureText: false,
                        hint: 'Familiyangizni kiriting',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Familiyangizni kiriting';
                          }
                          return null;
                        },
                      ),
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
                                // date_of_birth
                                TextFormField(
                                  controller: _dateOfBirthController,
                                  focusNode: _dateFocusNode,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [DateInputFormatter()],
                                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
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
                                  ),
                                  onChanged: (value) {
                                    // Check if full date is entered (8 digits = DD.MM.YYYY)
                                    final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
                                    if (digitsOnly.length == 8) {
                                      // Dismiss keyboard
                                      _dateFocusNode.unfocus();
                                    }
                                  },
                                  validator: (value) {
                                    if (value != null && value.isNotEmpty) {
                                      final digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
                                      if (digitsOnly.length < 8) {
                                        return 'To\'liq sanani kiriting';
                                      }
                                    }
                                    return null;
                                  },
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
                                  'Jinsi ', style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                ),
                                SizedBox(height: 10.h,),
                                // gender
                                DropdownButtonFormField<String>(
                                  borderRadius: BorderRadius.circular(30.r),
                                  iconSize: 25.sp,
                                  dropdownColor: AppColors.cxWhite,
                                  value: _selectedGender,
                                  decoration: inputDecoration,
                                  items: const [
                                    DropdownMenuItem(
                                        value: "male", child: Text("Erkak")),
                                    DropdownMenuItem(
                                        value: "female", child: Text("Ayol")),
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
                          'Telefon nomer *', style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                      // phone_number
                      AppTextField(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [PhoneInputFormatter()],
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
                          // Check if 9 digits are entered (after +998)
                          final digits = value.replaceAll(RegExp(r'[^0-9]'), '');
                          if (digits.length == 12) { // 998 + 9 digits
                            // Dismiss keyboard
                            _phoneFocusNode.unfocus();
                          }
                        },
                      ),
                              GestureDetector(
                                onTap: (){
                                  context.go(AppRoutes.login);
                                },
                                child: Text('Login page ga o\'tish', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.cx6B7280, decoration: TextDecoration.underline),),
                              ),
                            ],

                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: ButtonWidget(
                          text: isLoading ? 'Yuklanmoqda...' : 'Keyingisiga o\'tish',
                          onPressed: isLoading ? null : () => _handleRegister(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
