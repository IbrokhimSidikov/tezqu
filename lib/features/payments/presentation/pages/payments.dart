import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
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
        title: Text('To\'lovlarim', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
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
                icon: Icon(Icons.search),
                color: Colors.black,
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
                Text('Keyingi to\'lovlarim', style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Iconify(
                  Tabler.filter,
                  size: 27.sp,
                  color: AppColors.cxDADADA,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView(
                children: [
                  // Upcoming payments
                  _buildPaymentItem(
                    'BYD HAN',
                    '12.11.2024',
                    '\$350',
                    Icons.directions_car,
                    Colors.grey.shade700,
                  ),
                  SizedBox(height: 12.h),
                  _buildPaymentItem(
                    'iPhone 16pro max',
                    '15.11.2024',
                    '\$100',
                    Icons.phone_iphone,
                    Colors.grey.shade700,
                  ),
                  SizedBox(height: 24.h),
                  
                  // Payment history section
                  Text(
                    'To\'lovlarim tarixi',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  
                  _buildPaymentItem(
                    'Lixiang L9',
                    '12.10.2024',
                    '\$400',
                    Icons.directions_car,
                    Colors.grey.shade700,
                    isPaid: true,
                  ),
                  SizedBox(height: 12.h),
                  _buildPaymentItem(
                    'Deepal SL03',
                    '12.09.2024',
                    '\$550',
                    Icons.directions_car,
                    Colors.grey.shade700,
                    isPaid: true,
                  ),
                  SizedBox(height: 12.h),
                  _buildPaymentItem(
                    'Zeekr 001',
                    '12.08.2024',
                    '\$600',
                    Icons.directions_car,
                    Colors.orange,
                    isPaid: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentItem(String title, String date, String amount, IconData icon, Color iconColor, {bool isPaid = false}) {
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.cxAFB1B1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.cxBlack,
                ),
              ),
              if (isPaid) ...[
                SizedBox(height: 2.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'to\'landi',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
      ),
    );
  }
}
