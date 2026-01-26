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
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 16.0,
        left: 16.0,
        right: 20.0,
      ),
      child: Column(
        children: [
          if (payments.summary != null) ...[
            _buildSummaryDashboard(context, payments.summary!),
            SizedBox(height: 24.h),
          ],
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
              Iconify(
                Tabler.filter,
                size: 27.sp,
                color: AppColors.cxDADADA,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<PaymentCubit>().getPayments();
              },
              child: ListView(
                children: [
                  // Upcoming payments
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
                    ...payments.nextPayments.map((payment) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: _buildPaymentItem(
                          context,
                          payment,
                          isPaid: false,
                          allPayments: payments,
                        ),
                      );
                    }).toList(),

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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(BuildContext context, PaymentEntity payment, {required bool isPaid, PaymentsEntity? allPayments}) {
    // Determine icon based on product category
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

    // Get contract product info
    final contractProduct = payment.contract?.product;
    final productName = contractProduct?.name ?? payment.productName;
    final customFields = contractProduct?.customFields ?? {};

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
                color: Colors.grey.shade700,
                size: 20.sp,
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
                      children: customFields.entries.map((entry) {
                        return Text(
                          '${entry.key}: ${entry.value}',
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
              children: [
                Text(
                  '\$${payment.amount.toStringAsFixed(0)}',
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
