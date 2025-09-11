import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({super.key, this.hint, this.controller, this.validator, required this.obscureText, this.prefixIcon, this.inputFormatters, this.keyboardType, this.prefixText});

  final String? hint;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? prefixText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        prefixIcon: widget.prefixIcon,
        prefixText: widget.prefixText,
        prefixStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: Colors.black),
        hintText: widget.hint ?? "",
        hintStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.cxAFB1B1),
        filled: true,
        fillColor: AppColors.cxF5F7F9,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
