import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/shared/app_banner.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
        title: Text('Maxsulotlar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
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
            top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
        child: Column(
          children: [
            AppBanner(),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Toifalar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                Iconify(Tabler.filter, size: 27.sp, color: AppColors.cxDADADA,),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 12.sp),
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.cxF5F7F9,
                  child: Text('Auto', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.cxBlack),),
                  onPressed: (){},
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 12.sp),
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.cxF5F7F9,
                  child: Text('Telefon', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.cxBlack),),
                  onPressed: (){},
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 12.sp),
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.cxF5F7F9,
                  child: Text('Notebook', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColors.cxBlack),),
                  onPressed: (){},
                ),
              ]
            )
          ]
        ),
      ),
    );
  }
}

