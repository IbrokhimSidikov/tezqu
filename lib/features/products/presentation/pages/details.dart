

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tezqu/core/shared/app_banner.dart';
import 'package:tezqu/core/shared/button_widget_iconless.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/button_widget.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cxWhite,
      appBar: AppBar(
        backgroundColor: AppColors.cxWhite,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF5F7F9),
            ),
            child: IconButton(
              iconSize: 29.sp,
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ),
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
                icon: Icon(Icons.favorite, color: AppColors.cx43C19F,),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
        child: Column(
          children: [
            AppBanner(),
            SizedBox(height: 41.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DEEPAL",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "SL03",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.cx43C19F,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Mahsulot haqida qisqacha",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("• Brend – Nothing"),
                          Text("• Asosiy Kamera – 50 MP, 50 MP"),
                          Text("• Protsessor – Qualcomm Snapdragon 8+ Gen 1"),
                          Text("• Old kamera – 32 MP"),
                          Text("• Kameralar soni – 2"),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          // Cash option
                          Expanded(
                            child: Container(
                              width: 172.w,
                              height: 126.h,
                              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                              decoration: BoxDecoration(
                                color: AppColors.cxF7F6F9,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Naqdga",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "\$21,150",
                                    style: TextStyle(
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.cx43C19F,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Container(
                              width: 172.w,
                              height: 126.h,
                              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                              decoration: BoxDecoration(
                                color: AppColors.cxF7F6F9,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bo’lib to’lash",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    "12–24 oy gacha\nkelishuv asosida",
                                    style: TextStyle(fontSize: 18.sp, color: Colors.black54, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: ButtonWidgetIconless(text: 'Buyurtma berish', onPressed: (){
                context.push(AppRoutes.loginOtp);
              },
              ),
            ),
          ],

        ),
      )
    );
  }
}
