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
  int selectedTabIndex = 0;
  
  final List<Map<String, dynamic>> autoProducts = [
    {
      'name': 'BYD HAN',
      'year': '2024',
      'details': 'oq, 5,000km, 3 pozitsiya asdasdasd',
      'price': '\$31,350',
      'status': 'Active',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Lixiang L9',
      'year': '2025',
      'details': 'oq, 3,000km, Motoasdasdas',
      'price': '\$55,000',
      'status': 'Sotildi',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Deepal SL03',
      'year': '2024',
      'details': 'silver, 1,000km',
      'price': '\$21,150',
      'status': 'Active',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Zeekr 001',
      'year': '2025',
      'details': 'oq, 6,000km, Moto',
      'price': '\$55,000',
      'status': 'Active',
      'image': 'assets/images/car.svg'
    },
  ];

  final List<Map<String, dynamic>> phoneProducts = [
    {
      'name': 'iPhone 15 Pro',
      'year': '2024',
      'details': 'Space Black, 256GB',
      'price': '\$1,199',
      'status': 'Active',
      'image': 'assets/icons/iconBlack.svg'
    },
    {
      'name': 'Samsung Galaxy S24',
      'year': '2024',
      'details': 'Phantom Black, 512GB',
      'price': '\$899',
      'status': 'Sotildi',
      'image': 'assets/icons/iconBlack.svg'
    },
  ];

  final List<Map<String, dynamic>> notebookProducts = [
    {
      'name': 'MacBook Pro M3',
      'year': '2024',
      'details': '16-inch, 1TB SSD',
      'price': '\$2,499',
      'status': 'Active',
      'image': 'assets/icons/iconBlack.svg'
    },
    {
      'name': 'Dell XPS 13',
      'year': '2024',
      'details': 'Intel i7, 512GB',
      'price': '\$1,299',
      'status': 'Active',
      'image': 'assets/icons/iconBlack.svg'
    },
  ];

  List<Map<String, dynamic>> getCurrentProducts() {
    switch (selectedTabIndex) {
      case 0:
        return autoProducts;
      case 1:
        return phoneProducts;
      case 2:
        return notebookProducts;
      default:
        return autoProducts;
    }
  }

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
                  color:AppColors.cxF5F7F9,
                  child: Text('Auto',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: selectedTabIndex == 0 ? AppColors.cxBlack : AppColors.cxDADADA),
                  ),
                  onPressed: (){
                    setState(() {
                      selectedTabIndex = 0;
                    });
                  },
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 12.sp),
                  borderRadius: BorderRadius.circular(30.r),
                  color:AppColors.cxF5F7F9,
                  child: Text('Telefon',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: selectedTabIndex == 1 ? AppColors.cxBlack : AppColors.cxDADADA),
                  ),
                  onPressed: (){
                    setState(() {
                      selectedTabIndex = 1;
                    });
                  },
                ),
                CupertinoButton(
                  padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 12.sp),
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.cxF5F7F9,
                  child: Text('Notebook',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: selectedTabIndex == 2 ? AppColors.cxBlack : AppColors.cxDADADA),
                  ),
                  onPressed: (){
                    setState(() {
                      selectedTabIndex = 2;
                    });
                  },
                ),
              ]
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: getCurrentProducts().length,
                itemBuilder: (context, index) {
                  final product = getCurrentProducts()[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: AppColors.cxF5F7F9,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Icon(
                            selectedTabIndex == 0 ? Icons.directions_car : 
                            selectedTabIndex == 1 ? Icons.phone_android : 
                            Icons.laptop,
                            size: 30.sp,
                            color: AppColors.cxBlack,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.cxBlack,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '${product['year']}, ${product['details']}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.cxDADADA,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              product['price'],
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.cxBlack,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                color: product['status'] == 'Active' ? Colors.green : Colors.red,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                product['status'],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.cxWhite,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ]
        ),
      ),
    );
  }
}

