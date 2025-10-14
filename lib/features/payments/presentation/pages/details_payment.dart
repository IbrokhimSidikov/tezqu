import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:tezqu/core/shared/app_banner.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class DetailsPayment extends StatefulWidget {
  const DetailsPayment({super.key});

  @override
  State<DetailsPayment> createState() => _DetailsPaymentState();
}

class _DetailsPaymentState extends State<DetailsPayment> {
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
        title: Text('Title', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
      ),
      body: Padding(
          padding: EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 16.0, right: 20.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBanner(image: AppImages.reklama),
              SizedBox(height: 22.h),
              Row(
                children: [
                  Text(
                    'Qoldiq summa: ',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  Text(
                    '\$21,500',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cx43C19F,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: Column(
                  children: [
                    _buildTimelineItem('12.11.2024', '\$550', false, true),
                    _buildTimelineItem('12.10.2024', '\$550', true, false),
                    _buildTimelineItem('12.09.2024', '\$550', true, false),
                    _buildTimelineItem('12.08.2024', '\$550', true, false),
                    32.verticalSpace,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context){
                                    return Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.cxWhite,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25.r),
                                          topRight: Radius.circular(25.r),
                                        )
                                      ),
                                      child: Padding(padding: EdgeInsets.only(top: 20, left: 20, right: 20)),
                                    );
                                  }
                              );
                            },
                            child: Container(
                              width: 172.w,
                              height: 126.h,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.cxF7F6F9,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shartnoma',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text('11.07.2026',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.cxAFB1B1
                                      )),
                                  const Spacer(),
                                  Row(
                                      children: [Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 2),
                                        ),
                                        child: CircleAvatar(
                                          radius: 20.r,
                                          backgroundColor: AppColors.cxFEC700,
                                          child: const Icon(Icons.file_copy_outlined, color: Colors.black),
                                        ),
                                      ),]
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 172.w,
                            height: 126.h,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.cxF7F6F9,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Asosiy shart',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text('To\'lov:',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.cxAFB1B1
                                    )),
                                Text('Har oy:',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.cxAFB1B1
                                    )),
                                Text('Muddat:',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.cxAFB1B1
                                    )),
                              ],
                            ),
                          ),
                        ]
                    )
                  ],
                ),
              ),
            ]
          )
      ),
    );
  }

  Widget _buildTimelineItem(String date, String amount, bool isPaid, bool isFirst) {
    return Container(
      height: 60.h,
      child: Row(
        children: [
          Column(
            children: [
              if (!isFirst)
                Container(
                  width: 2.w,
                  height: 20.h,
                  color: AppColors.cx43C19F,
                ),
              Container(
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                  color: isPaid ? AppColors.cx43C19F : Colors.grey.shade300,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isPaid ? AppColors.cx43C19F : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: isPaid
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10.sp,
                      )
                    : null,
              ),
              if (!isFirst)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: AppColors.cx43C19F,
                  ),
                ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: isPaid ? AppColors.cxBlack : AppColors.cxB0B0B0,
                  ),
                ),
                // SizedBox(width: 25.w),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: isPaid ? AppColors.cxBlack : AppColors.cxB0B0B0,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
