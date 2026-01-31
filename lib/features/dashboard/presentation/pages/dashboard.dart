import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/presentation/cubit/dashboard_cubit.dart';
import '../../../home/presentation/cubit/dashboard_state.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  String _formatCurrency(double amount) {
    final formatter = NumberFormat('#,###', 'en_US');
    return '\$ ${formatter.format(amount)}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return BlocProvider(
      create: (context) => getIt<DashboardCubit>()..loadDashboard(),
      child: Scaffold(
        backgroundColor: AppColors.cxWhite,
        appBar: AppBar(
          backgroundColor: AppColors.cxWhite,
          title: Text(
            l10n.dashboardAnalytics,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
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
          centerTitle: true,
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return _buildShimmerLoading();
            }

            if (state is DashboardError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.errorLoadingDashboard,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(state.message),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () => context.read<DashboardCubit>().loadDashboard(),
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              );
            }

            final dashboard = state is DashboardLoaded ? state.dashboard : null;
            final data = dashboard?.data;

            if (data == null) {
              return Center(child: Text(l10n.noDataAvailable));
            }

            final totalPaymentsThisMonth = data.totalPaymentsThisMonth ?? 0;
            final totalIncomeThisMonth = data.totalIncomeThisMonth ?? 0;
            final totalExpensesThisMonth = data.totalExpensesThisMonth ?? 0;
            final totalProductsQty = data.totalProductsQty ?? 0;
            final netProfitThisMonth = data.netProfitThisMonth ?? 0;
            final activeContractsCount = data.activeContractsCount ?? 0;
            final pendingPaymentsCount = data.pendingPaymentsCount ?? 0;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Net Profit Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: netProfitThisMonth >= 0
                            ? [AppColors.cx78D9BF, AppColors.cx4AC1A7]
                            : [AppColors.cxFF8B92, Color(0xFFFF6B6B)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: (netProfitThisMonth >= 0 ? AppColors.cx78D9BF : AppColors.cxFF8B92).withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              netProfitThisMonth >= 0 ? Icons.trending_up : Icons.trending_down,
                              color: Colors.white,
                              size: 32.sp,
                            ),
                            SizedBox(width: 12.w),
                            Text(
                              l10n.netProfitThisMonth,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          _formatCurrency(netProfitThisMonth),
                          style: TextStyle(
                            fontSize: 36.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Income & Expenses Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          title: l10n.totalIncomeThisMonth,
                          value: _formatCurrency(totalIncomeThisMonth),
                          icon: Icons.arrow_downward,
                          color: AppColors.cx78D9BF,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildStatCard(
                          title: l10n.totalExpensesThisMonth,
                          value: _formatCurrency(totalExpensesThisMonth),
                          icon: Icons.arrow_upward,
                          color: AppColors.cxFF8B92,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Payments & Products Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          title: l10n.totalPaymentsThisMonth,
                          value: _formatCurrency(totalPaymentsThisMonth),
                          icon: Icons.payments,
                          color: AppColors.cx02D5F5,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildStatCard(
                          title: l10n.totalProductsQty,
                          value: '$totalProductsQty',
                          icon: Icons.inventory_2,
                          color: AppColors.cx292B2F,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Contracts & Pending Payments Row
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          title: l10n.activeContractsCount,
                          value: '$activeContractsCount',
                          icon: Icons.description,
                          color: AppColors.cxFEDA84,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: _buildStatCard(
                          title: l10n.pendingPaymentsCount,
                          value: '$pendingPaymentsCount',
                          icon: Icons.pending_actions,
                          color: AppColors.cxFEC700,
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
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cxF5F7F9, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Net Profit Card Shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: double.infinity,
              height: 140.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Income & Expenses Row Shimmer
          Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Payments & Products Row Shimmer
          Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Contracts & Pending Payments Row Shimmer
          Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
