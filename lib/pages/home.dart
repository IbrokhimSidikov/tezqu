import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../core/constants/app_colors.dart';
import '../core/shared/dashboard_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                iconSize: 29,
                icon: Icon(Icons.person),
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
                  iconSize: 29,
                  icon: Icon(Icons.notifications),
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
              Row(
                children: [
                  Iconify(Tabler.credit_card, color: AppColors.cx4AC1A7,),
                  SizedBox(width: 10.w),
                  Text('Umumiy to\'lovlarim', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                ],
              ),
              SizedBox(height: 0),
              Row(
                children: [
                  Text('\$ 12 345',
                      style:
                          TextStyle(fontSize: 53.sp, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 15.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.cx78D9BF,
                        child: Icon(Icons.access_time, color: AppColors.cxWhite),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          "Keyingi to'lov",
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "\$450",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cx78D9BF,
                        ),
                      ),
                      SizedBox(width: 32.w),
                      CircleAvatar(
                        backgroundColor: Colors.black87,
                        child: Icon(Icons.favorite, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          height: 8,
                          width: constraints.maxWidth * 0.6, // 60% progress
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFC9EBE4), // 30%
                                Color(0xFF4BC1A9), // 100%
                              ],
                              stops: [0.3, 1.0], // gradient starts at 30%
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 39.h),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 29.h,
                crossAxisSpacing: 16.w,
                childAspectRatio: 1.2, // adjust shape
                children: [
                  DashboardCard(
                    title: "To'lovlarim",
                    icons: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: AppColors.cxFF8B92,
                          child: const Icon(Icons.attach_money, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  DashboardCard(
                    title: "Maxsulotlar",
                    icons: [
                          CircleAvatar(radius: 22.r, backgroundColor: AppColors.cx78D9BF, child: Icon(Icons.directions_car, color: Colors.white)),
                          CircleAvatar(radius: 22.r, backgroundColor: AppColors.cxFEDA84, child: Icon(Icons.bus_alert, color: Colors.black)),
                          CircleAvatar(radius: 22.r, backgroundColor: AppColors.cxFFBCFA, child: Icon(Icons.home, color: Colors.black)),

                    ],
                  ),
                  DashboardCard(
                    title: "Kirimlar",
                    subtitle: "\$123,500",
                    icons: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: AppColors.cx78D9BF,
                          child: const Icon(Icons.swap_horiz, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  DashboardCard(
                    title: "Chiqimlar",
                    subtitle: "\$1,500",
                    icons: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: AppColors.cxFEC700,
                          child: const Icon(Icons.arrow_upward, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  DashboardCard(title: 'Omborxona',
                    subtitle: 'Maxsulot: 120',
                    icons: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: AppColors.cx292B2F,
                        child: const Icon(Icons.inventory_2_outlined, color: Colors.white),
                        ),
                    ),
                    ],
                  ),
                  DashboardCard(title: 'Dashboard',
                    subtitle: 'Faollik: 01.24',
                    icons: [
                      Container(
                        padding: EdgeInsets.all(2), // space for the border
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2), // white border
                        ),
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: AppColors.cx02D5F5,
                          child: const Icon(Icons.bar_chart_outlined, color: Colors.white),
                        ),
                      )

                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
