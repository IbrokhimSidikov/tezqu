import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> kollektorData = [
    {
      'name': 'Oybek Karimov',
      'price': '\$31,350',
      'status': 'To\'liq',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Jamoliddin Qobilov',
      'price': '\$31,350',
      'status': 'Jarayonda',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Nuriddin Haydarov',
      'price': '\$31,350',
      'status': 'Jarayonda',
      'image': 'assets/images/car.svg'
    },
  ];
  final List<Map<String, dynamic>> mijozData = [
    {
      'name': 'Muhriddin Xoliqov',
      'price': '\$31,350',
      'status': 'To\'liq',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Sherali Jo\'rayev',
      'price': '\$31,350',
      'status': 'Jarayonda',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Jumaboy To\'raboyev',
      'price': '\$31,350',
      'status': 'Jarayonda',
      'image': 'assets/images/car.svg'
    },
  ];
  final List<Map<String, dynamic>> investorData = [
    {
      'name': 'Shamsiddin Abdusattorov',
      'price': '\$31,350',
      'status': 'To\'liq',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Sherali Jo\'rayev',
      'price': '\$31,350',
      'status': 'Jarayonda',
      'image': 'assets/images/car.svg'
    },
    {
      'name': 'Jumaboy To\'raboyev',
      'price': '\$31,350',
      'status': 'Jarayonda',
      'image': 'assets/images/car.svg'
    },
  ];

  List<Map<String, dynamic>> getIncomeData() {
    switch (selectedTabIndex) {
      case 0:
        return kollektorData;
      case 1:
        return mijozData;
      case 2:
        return investorData;
      default:
        return [];
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
        title: Text('Kirimlar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
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
                Text('Kirim manbalari', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                Iconify(Tabler.filter, size: 27.sp, color: AppColors.cxDADADA,
                ),
              ],
            ),
            SizedBox(height: 18.h,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 12.sp),
                    borderRadius: BorderRadius.circular(30.r),
                    color:AppColors.cxF5F7F9,
                    child: Text('Kollektor',
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
                    child: Text('Mijoz',
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
                    child: Text('Investor',
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
                  itemCount: getIncomeData().length,
                  itemBuilder: (context, index) {
                    final product = getIncomeData()[index];
                    return GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context){
                              return ModalContainer();
                            }
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.h, left: 10.h),
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
                                selectedTabIndex == 0 ? Icons.person_3_outlined :
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
                                    color: product['status'] == 'To\'liq'
                                        ? Colors.green
                                        : product['status'] == 'Olindi'
                                        ? Colors.black
                                        : Colors.red,
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
                      ),
                    );
                  },
                ),
            ),
          ],
        )
      ),
    );
  }
}

class ModalContainer extends StatelessWidget {
  const ModalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: 20.h, left: 38.w, right: 20.w
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User name', style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),)
              ]
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final product = [];
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
                            Icons.directions_car,
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
                                '',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.cxBlack,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '',
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
                              '',
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
                                color: AppColors.cx43C19F,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                '',
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
            ),
          ]
        ),
      ),
    );
  }
}
