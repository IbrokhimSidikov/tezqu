import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../domain/entities/income_entity.dart';
import '../cubit/income_cubit.dart';
import '../cubit/income_state.dart';

class Income extends StatelessWidget {
  const Income({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<IncomeCubit>()..getIncomeSources(
        year: DateTime.now().year,
        month: DateTime.now().month,
      ),
      child: const IncomeView(),
    );
  }
}

class IncomeView extends StatefulWidget {
  const IncomeView({super.key});

  @override
  State<IncomeView> createState() => _IncomeViewState();
}

class _IncomeViewState extends State<IncomeView> {
  int selectedTabIndex = 0;

  List<IncomeSourceEntity> getIncomeData(IncomeSourcesEntity incomeSources) {
    switch (selectedTabIndex) {
      case 0:
        return incomeSources.collectors;
      case 1:
        return incomeSources.clients;
      case 2:
        return incomeSources.investors;
      default:
        return [];
    }
  }

  Widget _buildIncomeContent(BuildContext context, IncomeSourcesEntity incomeSources) {
    return Padding(
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
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<IncomeCubit>().getIncomeSources(
                    year: DateTime.now().year,
                    month: DateTime.now().month,
                  );
                },
                child: ListView.builder(
                  itemCount: getIncomeData(incomeSources).length,
                  itemBuilder: (context, index) {
                    final source = getIncomeData(incomeSources)[index];
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
                                    source.name,
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
                                  '\$${source.amount.toStringAsFixed(0)}',
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
                                    color: source.status == 'To\'liq'
                                        ? Colors.green
                                        : source.status == 'Olindi'
                                        ? Colors.black
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Text(
                                    source.status,
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
          ),
        ],
      )
    );
  }

  Widget _buildShimmerLoading() {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, bottom: 16.0, left: 16.0, right: 20.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 200.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(height: 18.h),
          // Tabs shimmer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 20.h),
          // List items shimmer
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: _buildShimmerItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.only(right: 16.w, top: 16.h, bottom: 16.h, left: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 60.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 4.h),
                Container(
                  width: 50.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
      body: BlocBuilder<IncomeCubit, IncomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildShimmerLoading(),
            loading: () => _buildShimmerLoading(),
            loaded: (incomeSources) => _buildIncomeContent(context, incomeSources),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 60.sp, color: Colors.red),
                  SizedBox(height: 16.h),
                  Text(
                    'Xatolik yuz berdi',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.cxAFB1B1,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<IncomeCubit>().getIncomeSources(
                        year: DateTime.now().year,
                        month: DateTime.now().month,
                      );
                    },
                    child: const Text('Qayta urinish'),
                  ),
                ],
              ),
            ),
          );
        },
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
                itemCount: 0,
                itemBuilder: (context, index) {
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
