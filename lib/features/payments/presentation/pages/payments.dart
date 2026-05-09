import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tezqu/l10n/app_localizations_delegate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/payment_entity.dart';
import '../cubit/payment_cubit.dart';
import '../cubit/payment_state.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymentCubit>()..getPayments(),
      child: const PaymentsView(),
    );
  }
}

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

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
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context).myPayments,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
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
                icon: const Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildShimmerLoading(),
            loading: () => _buildShimmerLoading(),
            loaded: (payments) => _buildPaymentsList(context, payments),
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
                      context.read<PaymentCubit>().getPayments();
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

  Widget _buildPaymentsList(BuildContext context, PaymentsEntity payments) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PaymentCubit>().getPayments();
      },
      child: ListView(
        padding: EdgeInsets.only(
          top: 16.h,
          bottom: 16.h,
          left: 16.w,
          right: 20.w,
        ),
        children: [
          // Summary Dashboard
          if (payments.summary != null) ...[
            _buildSummaryDashboard(context, payments.summary!),
            SizedBox(height: 24.h),
          ],
          
          // Next Payments Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).nextPayments,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

            ],
          ),
          SizedBox(height: 20.h),
          
          // Upcoming payments - Horizontal scrollable with max 3 items
          if (payments.nextPayments.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h),
                child: Text(
                  AppLocalizations.of(context).noNextPayments,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.cxAFB1B1,
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: 240.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: payments.nextPayments.length > 3 ? 3 : payments.nextPayments.length,
                itemBuilder: (context, index) {
                  final payment = payments.nextPayments[index];
                  return Container(
                    width: 280.w,
                    margin: EdgeInsets.only(right: 16.w),
                    child: _buildNextPaymentCard(
                      context,
                      payment,
                      allPayments: payments,
                    ),
                  );
                },
              ),
            ),

          SizedBox(height: 24.h),

          // Payment history section
          Text(
            AppLocalizations.of(context).paymentsHistory,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.cxBlack,
            ),
          ),
          SizedBox(height: 16.h),

          if (payments.paidPayments.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h),
                child: Text(
                  AppLocalizations.of(context).noPaymentsHistory,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.cxAFB1B1,
                  ),
                ),
              ),
            )
          else
            ...payments.paidPayments.map((payment) {
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildPaymentItem(
                  context,
                  payment,
                  isPaid: true,
                  allPayments: payments,
                ),
              );
            }).toList(),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(BuildContext context, PaymentEntity payment, {required bool isPaid, PaymentsEntity? allPayments}) {
    // Get contract product info
    final contractProduct = payment.contract?.product;
    final productName = contractProduct?.name ?? payment.productName;
    final customFields = contractProduct?.customFields ?? {};
    
    // Get product image URL
    final imageUrl = payment.productImage;
    
    // Determine icon based on product category as fallback
    IconData icon = Icons.shopping_bag;
    if (payment.productCategory != null) {
      final category = payment.productCategory!.toLowerCase();
      if (category.contains('car') || category.contains('auto')) {
        icon = Icons.directions_car;
      } else if (category.contains('phone') || category.contains('mobile')) {
        icon = Icons.phone_iphone;
      } else if (category.contains('laptop') || category.contains('computer')) {
        icon = Icons.laptop;
      } else if (category.contains('home') || category.contains('house')) {
        icon = Icons.home;
      }
    }

    return InkWell(
      onTap: () {
        context.pushNamed(
          'detailsPayment',
          queryParameters: {'contractId': payment.contractId.toString()},
          extra: {
            'payment': payment,
            'allPayments': allPayments,
          },
        );
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isPaid 
              ? [Colors.white, AppColors.cx43C19F.withOpacity(0.05)]
              : [Colors.white, Colors.white],
          ),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isPaid ? AppColors.cx43C19F.withOpacity(0.3) : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isPaid 
                ? AppColors.cx43C19F.withOpacity(0.1)
                : Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Product Image or Icon
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.grey.shade100,
              ),
              child: imageUrl != null && imageUrl.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.cx43C19F,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        icon,
                        color: Colors.grey.shade600,
                        size: 28.sp,
                      ),
                    ),
                  )
                : Icon(
                    icon,
                    color: Colors.grey.shade600,
                    size: 28.sp,
                  ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    payment.dueDate,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.cxAFB1B1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Display custom fields if available
                  if (customFields.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 4.h,
                      children: customFields.entries
                          .where((entry) => ['yili', 'rangi', 'yoqilgi_turi'].contains(entry.key))
                          .map((entry) {
                        String label = entry.key;
                        if (entry.key == 'yili') label = 'Year';
                        if (entry.key == 'rangi') label = 'Color';
                        if (entry.key == 'yoqilgi_turi') label = 'Fuel type';
                        
                        return Text(
                          '$label: ${entry.value}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.cxAFB1B1,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isPaid 
                        ? [AppColors.cx43C19F, AppColors.cx43C19F.withOpacity(0.8)]
                        : [AppColors.cxFEC700, AppColors.cxFEC700.withOpacity(0.8)],
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: (isPaid ? AppColors.cx43C19F : AppColors.cxFEC700).withOpacity(0.3),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isPaid ? Icons.check_circle : Icons.schedule,
                        color: Colors.white,
                        size: 14.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        isPaid ? AppLocalizations.of(context).paid : 'Pending',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '\$${payment.amount.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cxBlack,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextPaymentCard(BuildContext context, PaymentEntity payment, {PaymentsEntity? allPayments}) {
    final contractProduct = payment.contract?.product;
    final productName = contractProduct?.name ?? payment.productName;
    final imageUrl = payment.productImage;
    
    // Determine icon based on product category as fallback
    IconData icon = Icons.shopping_bag;
    if (payment.productCategory != null) {
      final category = payment.productCategory!.toLowerCase();
      if (category.contains('car') || category.contains('auto')) {
        icon = Icons.directions_car;
      } else if (category.contains('phone') || category.contains('mobile')) {
        icon = Icons.phone_iphone;
      } else if (category.contains('laptop') || category.contains('computer')) {
        icon = Icons.laptop;
      } else if (category.contains('home') || category.contains('house')) {
        icon = Icons.home;
      }
    }

    return InkWell(
      onTap: () {
        context.pushNamed(
          'detailsPayment',
          queryParameters: {'contractId': payment.contractId.toString()},
          extra: {
            'payment': payment,
            'allPayments': allPayments,
          },
        );
      },
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.cxFEC700.withOpacity(0.1),
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.cxFEC700.withOpacity(0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.cxFEC700.withOpacity(0.15),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(18.r),
                ),
                color: Colors.grey.shade100,
              ),
              child: Stack(
                children: [
                  // Product Image
                  if (imageUrl != null && imageUrl.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.r),
                        topRight: Radius.circular(18.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        width: double.infinity,
                        height: 100.h,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.cxFEC700,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(
                            icon,
                            color: Colors.grey.shade400,
                            size: 40.sp,
                          ),
                        ),
                      ),
                    )
                  else
                    Center(
                      child: Icon(
                        icon,
                        color: Colors.grey.shade400,
                        size: 40.sp,
                      ),
                    ),
                  // Status Badge
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: AppColors.cxFEC700,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.cxFEC700.withOpacity(0.4),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Colors.white,
                            size: 12.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Pending',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Details Section
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cxBlack,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14.sp,
                        color: AppColors.cxAFB1B1,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        payment.dueDate,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cxAFB1B1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  // Check if payment is partial
                  if (payment.status.toLowerCase() == 'partial') ...[
                    // Show paid and remaining amounts for partial payments
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.cx43C19F.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context).paidAmount,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.cx43C19F,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\$${payment.amountPaid.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.cx43C19F,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.cxFEC700.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: AppColors.cxFEC700.withOpacity(0.4),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                size: 14.sp,
                                color: AppColors.cxFEC700,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Left to Pay',
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.cxFEC700,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$${payment.amountRemaining.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.cxFEC700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else
                    // Show total amount for non-partial payments
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.cxFEC700.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.cxAFB1B1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '\$${payment.amount.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.cxBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
        left: 16.0,
        right: 20.0,
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
          SizedBox(height: 20.h),
          // Payment items shimmer
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _buildShimmerPaymentItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerPaymentItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // Icon shimmer
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name shimmer
                  Container(
                    width: double.infinity,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Date shimmer
                  Container(
                    width: 120.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            // Amount shimmer
            Container(
              width: 60.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryDashboard(BuildContext context, SummaryEntity summary) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Pie Chart
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: _buildPieChart(summary),
          ),
          SizedBox(width: 16.w),
          // Stats
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).paymentSummary,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 12.h),
                _buildCompactStat(
                  color: AppColors.cx43C19F,
                  label: AppLocalizations.of(context).paidAmount,
                  value: '\$${summary.totalPaid.toStringAsFixed(0)}',
                  count: '${summary.paidCount} ${AppLocalizations.of(context).items}',
                ),
                SizedBox(height: 8.h),
                _buildCompactStat(
                  color: AppColors.cxFEC700,
                  label: AppLocalizations.of(context).remainingPayments,
                  value: '\$${summary.totalRemaining.toStringAsFixed(0)}',
                  count: '${summary.remainingCount} ${AppLocalizations.of(context).items}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart(SummaryEntity summary) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 30.r,
        sections: [
          PieChartSectionData(
            color: AppColors.cx43C19F,
            value: summary.totalPaid,
            title: '${summary.completionPercentage}%',
            radius: 35.r,
            titleStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            color: AppColors.cxFEC700,
            value: summary.totalRemaining,
            title: '',
            radius: 35.r,
          ),
        ],
      ),
    );
  }

  Widget _buildCompactStat({
    required Color color,
    required String label,
    required String value,
    required String count,
  }) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.cxAFB1B1,
                ),
              ),
              Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    count,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
