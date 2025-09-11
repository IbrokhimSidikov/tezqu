import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cxWhite,
      appBar: AppBar(
        backgroundColor: AppColors.cxWhite,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
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
        title: Text('Chiqimlar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cxF5F7F9,
              ),
              child: IconButton(
                iconSize: 29.sp,
                icon: Icon(Icons.add),
                color: AppColors.cx43C19F,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(
          top: 16.0, bottom: 16.0, left: 16.0, right: 20.0
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chiqimlar toifasi', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                Iconify(Tabler.search, size: 27.sp, color: AppColors.cxDADADA,
                ),
              ],
            ),
            SizedBox(
              height: 28.w,
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildExpenseCategory(
                    'Natarus xizmati',
                    Icons.description,
                    Colors.orange.shade100,
                    Colors.orange,
                  ),
                  SizedBox(height: 16.h),
                  _buildExpenseCategory(
                    'Avans',
                    Icons.payments,
                    Colors.blue.shade100,
                    Colors.blue,
                  ),
                  SizedBox(height: 16.h),
                  _buildExpenseCategory(
                    'Komunal to\'lov',
                    Icons.calculate,
                    Colors.green.shade100,
                    Colors.green,
                  ),
                  SizedBox(height: 16.h),
                  _buildExpenseCategory(
                    'Office arenda',
                    Icons.business,
                    Colors.grey.shade800,
                    Colors.pink,
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget _buildExpenseCategory(String title, IconData icon, Color backgroundColor, Color iconColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            title,
            style: TextStyle(
              fontSize:20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.cxBlack,
            ),
          ),
        ],
      ),
    );
  }
}
