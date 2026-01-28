import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/user_roles.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/dashboard_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../cubit/dashboard_cubit.dart';
import '../cubit/dashboard_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardCubit>()..loadDashboard(),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  String _formatCurrency(double amount) {
    final formatter = NumberFormat('#,###', 'en_US');
    return '\$ ${formatter.format(amount)}';
  }

  List<Widget> _buildDashboardCards(BuildContext context, UserRole userRole) {
    final allCards = <DashboardCardType, Widget>{
      DashboardCardType.payments: DashboardCard(
        onTap: () {
          context.push(AppRoutes.payments);
        },
        title: AppLocalizations.of(context).myPayments,
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
      DashboardCardType.products: DashboardCard(
        title: AppLocalizations.of(context).products,
        onTap: () {
          context.push(AppRoutes.products);
        },
        icons: [
          CircleAvatar(radius: 22.r, backgroundColor: AppColors.cx78D9BF, child: Icon(Icons.directions_car, color: Colors.white)),
          CircleAvatar(radius: 22.r, backgroundColor: AppColors.cxFEDA84, child: Icon(Icons.bus_alert, color: Colors.black)),
          CircleAvatar(radius: 22.r, backgroundColor: AppColors.cxFFBCFA, child: Icon(Icons.home, color: Colors.black)),
        ],
      ),
      DashboardCardType.income: DashboardCard(
        onTap: () {
          context.push(AppRoutes.income);
        },
        title: AppLocalizations.of(context).income,
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
      DashboardCardType.expense: DashboardCard(
        onTap: () {
          context.push(AppRoutes.expense);
        },
        title: AppLocalizations.of(context).expenses,
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
      DashboardCardType.warehouse: DashboardCard(
        onTap: () {
          context.push(AppRoutes.warehouse);
        },
        title: AppLocalizations.of(context).warehouse,
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
      DashboardCardType.dashboard: DashboardCard(
        title: AppLocalizations.of(context).dashboard,
        subtitle: 'Faollik: 01.24',
        icons: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.cx02D5F5,
              child: const Icon(Icons.bar_chart_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    };

    // Filter cards based on user role
    final allowedCards = RolePermissions.getAllowedCards(userRole);
    return allowedCards
        .where((cardType) => allCards.containsKey(cardType))
        .map((cardType) => allCards[cardType]!)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.cxWhite,
        appBar: AppBar(
          backgroundColor: AppColors.cxWhite,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child:
               Container(
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: const Color(0xFFF5F7F9),
                 ),
                child: IconButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.profile);
                  },
                  icon: Icon(Icons.person),
                  color: AppColors.cxBlack,
                  style: IconButton.styleFrom(
                    iconSize: 32,
                  ),
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
                  onPressed: () {
                    context.push(AppRoutes.notifications);
                  },
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const _HomeShimmerLoading();
            }

            if (state is DashboardError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Xatolik yuz berdi',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(state.message),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () => context.read<DashboardCubit>().loadDashboard(),
                      child: const Text('Qayta urinish'),
                    ),
                  ],
                ),
              );
            }

            final dashboard = state is DashboardLoaded ? state.dashboard : null;
            final totalContractAmount = dashboard?.data.totalContractAmount ?? 0;
            final totalPaid = dashboard?.data.totalPaid ?? 0;
            final totalRemaining = dashboard?.data.totalRemaining ?? 0;
            final nextPaymentAmount = dashboard?.data.nextPaymentAmount ?? 0;
            final activeContracts = dashboard?.data.activeContracts ?? 0;
            
            // Get user role from dashboard
            final userRole = UserRole.fromString(dashboard?.role);

            // Calculate progress percentage
            final progressPercentage = totalContractAmount > 0 
                ? totalPaid / totalContractAmount 
                : 0.0;

            return Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Iconify(Tabler.credit_card, color: AppColors.cx4AC1A7,),
                        SizedBox(width: 10.w),
                        Text(AppLocalizations.of(context).totalPayments, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 0),
                    Row(
                      children: [
                        Text(
                          _formatCurrency(totalContractAmount),
                          style: TextStyle(fontSize: 53.sp, fontWeight: FontWeight.bold)
                        ),
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
                                AppLocalizations.of(context).nextPayment,
                                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              _formatCurrency(nextPaymentAmount),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.cx78D9BF,
                              ),
                            ),
                            SizedBox(width: 32.w),
                            CircleAvatar(
                              backgroundColor: Colors.black87,
                              child: IconButton(
                                  iconSize: 24.sp,
                                  onPressed: () {
                                    context.push(AppRoutes.favourites);
                                  },
                                  icon: Icon(Icons.favorite),
                                  color: AppColors.cxWhite,
                              ),
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
                                width: constraints.maxWidth * progressPercentage,
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
                  children: _buildDashboardCards(context, userRole),
                )
              ],
            ),
          ),
        );
          },
        ),
      ),
    );
  }
}

class _HomeShimmerLoading extends StatelessWidget {
  const _HomeShimmerLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Static title (no shimmer needed)
            Row(
              children: [
                Iconify(Tabler.credit_card, color: AppColors.cx4AC1A7),
                SizedBox(width: 10.w),
                Text(
                  AppLocalizations.of(context).totalPayments,
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 0),
            // Total amount shimmer (dynamic data)
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 250.w,
                    height: 53.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            // Next payment section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Static icon (no shimmer)
                    CircleAvatar(
                      backgroundColor: AppColors.cx78D9BF,
                      child: Icon(Icons.access_time, color: AppColors.cxWhite),
                    ),
                    SizedBox(width: 12.w),
                    // Static text (no shimmer)
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context).nextPayment,
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    // Next payment amount shimmer (dynamic data)
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    SizedBox(width: 32.w),
                    // Static favorite icon (no shimmer)
                    CircleAvatar(
                      backgroundColor: Colors.black87,
                      child: Icon(Icons.favorite, color: AppColors.cxWhite),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                // Progress bar shimmer (dynamic data)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 39.h),
            // Static dashboard cards (no shimmer needed)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 29.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 1.2,
              children: [
                DashboardCard(
                  onTap: () {},
                  title: AppLocalizations.of(context).myPayments,
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
                  title: AppLocalizations.of(context).products,
                  onTap: () {},
                  icons: [
                    CircleAvatar(radius: 22.r, backgroundColor: AppColors.cx78D9BF, child: Icon(Icons.directions_car, color: Colors.white)),
                    CircleAvatar(radius: 22.r, backgroundColor: AppColors.cxFEDA84, child: Icon(Icons.bus_alert, color: Colors.black)),
                    CircleAvatar(radius: 22.r, backgroundColor: AppColors.cxFFBCFA, child: Icon(Icons.home, color: Colors.black)),
                  ],
                ),
                DashboardCard(
                  onTap: () {},
                  title: AppLocalizations.of(context).income,
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
                  onTap: () {},
                  title: AppLocalizations.of(context).expenses,
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
                DashboardCard(
                  onTap: () {},
                  title: AppLocalizations.of(context).warehouse,
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
                DashboardCard(
                  title: AppLocalizations.of(context).dashboard,
                  subtitle: 'Faollik: 01.24',
                  icons: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
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
            ),
          ],
        ),
      ),
    );
  }
}
