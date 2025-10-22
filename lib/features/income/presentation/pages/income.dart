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
                        // Determine source type based on selected tab
                        String sourceType = selectedTabIndex == 0 
                            ? 'collector' 
                            : selectedTabIndex == 1 
                                ? 'customer' 
                                : 'investor';
                        
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext modalContext){
                              return BlocProvider(
                                create: (context) => getIt<IncomeCubit>(),
                                child: ModalContainer(
                                  userId: source.id,
                                  userName: source.name,
                                  sourceType: sourceType,
                                ),
                              );
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
            detailLoading: () => _buildShimmerLoading(),
            detailLoaded: (detail) => _buildShimmerLoading(),
            detailError: (message) => _buildShimmerLoading(),
          );
        },
      ),
    );
  }
}

class ModalContainer extends StatefulWidget {
  final String userId;
  final String userName;
  final String sourceType;

  const ModalContainer({
    super.key,
    required this.userId,
    required this.userName,
    required this.sourceType,
  });

  @override
  State<ModalContainer> createState() => _ModalContainerState();
}

class _ModalContainerState extends State<ModalContainer> {
  @override
  void initState() {
    super.initState();
    // Use the modal's own cubit instance
    Future.microtask(() {
      if (mounted) {
        context.read<IncomeCubit>().getIncomeDetail(
          sourceType: widget.sourceType,
          userId: widget.userId,
          year: DateTime.now().year,
          month: DateTime.now().month,
        );
      }
    });
  }

  IconData _getIconForCategory(String category) {
    final lowerCategory = category.toLowerCase();
    if (lowerCategory.contains('car') || lowerCategory.contains('auto')) {
      return Icons.directions_car;
    } else if (lowerCategory.contains('phone') || lowerCategory.contains('mobile')) {
      return Icons.phone_iphone;
    } else if (lowerCategory.contains('laptop') || lowerCategory.contains('computer')) {
      return Icons.laptop;
    } else if (lowerCategory.contains('home') || lowerCategory.contains('house')) {
      return Icons.home;
    }
    return Icons.shopping_bag;
  }

  Color _getStatusColor(String status) {
    final lowerStatus = status.toLowerCase();
    if (lowerStatus.contains('paid') || lowerStatus.contains('olindi')) {
      return Colors.green;
    } else if (lowerStatus.contains('pending') || lowerStatus.contains('kutilmoqda')) {
      return Colors.orange;
    } else if (lowerStatus.contains('overdue') || lowerStatus.contains('kechikkan') || lowerStatus.contains('berilmadi')) {
      return Colors.red;
    }
    return Colors.grey;
  }

  String _getStatusText(String status) {
    final lowerStatus = status.toLowerCase();
    if (lowerStatus.contains('paid')) {
      return 'Olindi';
    } else if (lowerStatus.contains('pending')) {
      return 'Qoldirildi';
    } else if (lowerStatus.contains('overdue')) {
      return 'Berilmadi';
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: BlocBuilder<IncomeCubit, IncomeState>(
        builder: (context, state) {
          return state.maybeWhen(
            detailLoading: () => Center(
              child: CircularProgressIndicator(),
            ),
            detailLoaded: (incomeDetail) => Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Centered Title
                      Center(
                        child: Text(
                          incomeDetail.userName,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.cxBlack,
                          ),
                        ),
                      ),
                      // Close button on the right
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close, size: 24.sp),
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Contracts List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: incomeDetail.contracts.length,
                    itemBuilder: (context, index) {
                      final contract = incomeDetail.contracts[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                            // Product Image Circle
                            Container(
                              width: 55.w,
                              height: 55.h,
                              decoration: BoxDecoration(
                                color: AppColors.cxF5F7F9,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.directions_car,
                                size: 28.sp,
                                color: AppColors.cxBlack,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Customer Name
                                  Text(
                                    incomeDetail.userName,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.cxBlack,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  // Product Name in Cyan
                                  Text(
                                    contract.productName,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF00BCD4), // Cyan color
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  // Card and Naqd info
                                  Row(
                                    children: [
                                      Text(
                                        contract.productCategory,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.cxAFB1B1,
                                        ),
                                      ),
                                      if (contract.dueDate != null) ...[
                                        SizedBox(width: 16.w),
                                        Text(
                                          'Naqd \$${(contract.amount * 0.3).toStringAsFixed(0)}',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.cxAFB1B1,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  if (contract.dueDate != null) ...[
                                    SizedBox(height: 2.h),
                                    Text(
                                      'Berilish sanasi: ${contract.dueDate}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.cxAFB1B1,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${contract.amount.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.cxBlack,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(contract.status),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Text(
                                    _getStatusText(contract.status),
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.cxWhite,
                                      fontWeight: FontWeight.w600,
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
                
                // Total Section
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cxBlack,
                            ),
                          ),
                          Text(
                            '\$${incomeDetail.totalAmount.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cxBlack,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yeg\'ilgan:',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.cxAFB1B1,
                            ),
                          ),
                          Text(
                            '\$${incomeDetail.totalPaid.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.cxAFB1B1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Implement accept action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.cxBlack,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Qabul qilish',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.cxWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            detailError: (message) => Center(
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
                ],
              ),
            ),
            orElse: () => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
