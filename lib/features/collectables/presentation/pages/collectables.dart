import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../expense/data/models/payment_method_model.dart';
import '../../domain/entities/collectable_entity.dart';
import '../cubit/collectables_cubit.dart';
import '../cubit/collectables_state.dart';
import '../widgets/collectable_card_shimmer.dart';
import '../widgets/collect_payment_dialog.dart';

class CollectablesPage extends StatelessWidget {
  const CollectablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CollectablesCubit>()..loadCollectables(),
      child: const _CollectablesPageContent(),
    );
  }
}

class _CollectablesPageContent extends StatelessWidget {
  const _CollectablesPageContent();

  String _formatCurrency(double amount) {
    if (amount == amount.toInt()) {
      final formatter = NumberFormat('#,###', 'en_US');
      return '\$ ${formatter.format(amount.toInt())}';
    }
    final formatter = NumberFormat('#,###', 'en_US');
    return '\$ ${formatter.format(amount)}';
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateStr;
    }
  }

  Color _getStatusColor(String status, int daysOverdue) {
    if (daysOverdue > 0 || status.toLowerCase() == 'overdue') {
      return AppColors.cxFF8B92;
    }
    if (daysOverdue == 0 || status.toLowerCase() == 'due_today') {
      return AppColors.cxBlack;
    }
    return AppColors.cx78D9BF;
  }

  String _getStatusText(String status, int daysOverdue, BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (daysOverdue > 0) {
      return l10n.overdue;
    }
    if (daysOverdue == 0) {
      return l10n.dueToday;
    }
    return l10n.pending;
  }

  List<CollectablePaymentEntity> _getAllPendingPayments(
    CollectablesEntity collectables,
    String? currentUserId,
  ) {
    final allPayments = <CollectablePaymentEntity>[];
    for (final contract in collectables.contracts) {
      for (final payment in contract.payments) {
        final isPending = payment.status.toLowerCase() == 'pending' || payment.amountRemaining > 0;
        final isAssignedToCurrentCollector = currentUserId == null ||
                                             payment.collectorId == null ||
                                             payment.collectorId == currentUserId;

        if (isPending && isAssignedToCurrentCollector) {
          allPayments.add(payment);
        }
      }
    }

    allPayments.sort((a, b) {
      try {
        final dateA = DateTime.parse(a.dueDate);
        final dateB = DateTime.parse(b.dueDate);
        return dateA.compareTo(dateB);
      } catch (e) {
        return 0;
      }
    });

    return allPayments;
  }

  CollectableContractEntity? _findContractForPayment(
    CollectablesEntity collectables,
    String contractId,
  ) {
    try {
      return collectables.contracts.firstWhere(
        (contract) => contract.id == contractId,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.cxF5F5F5,
      appBar: AppBar(
        backgroundColor: AppColors.cxWhite,
        elevation: 0,
        title: Text(
          l10n.collectables,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.cxBlack,
          ),
        ),
        centerTitle: true,
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
      ),
      body: BlocBuilder<CollectablesCubit, CollectablesState>(
        builder: (context, state) {
          if (state is CollectablesLoading) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const CollectableCardShimmer();
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is CollectablesError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64.sp,
                    color: AppColors.cxFF8B92,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    l10n.error,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    state.message,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CollectablesCubit>().loadCollectables();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cxBlack,
                      foregroundColor: AppColors.cxWhite,
                    ),
                    child: Text(l10n.retry),
                  ),
                ],
              ),
            );
          }

          if (state is CollectablesLoaded) {
            final allPayments = _getAllPendingPayments(state.collectables, null);
            final totalAmount = allPayments.fold<double>(
              0,
              (sum, payment) => sum + payment.amountRemaining,
            );

            if (allPayments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 64.sp,
                      color: AppColors.cx78D9BF,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      l10n.noPaymentsToCollect,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cxBlack,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      l10n.allPaymentsCollected,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () => context.read<CollectablesCubit>().refreshCollectables(),
              color: AppColors.cx78D9BF,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(16.w),
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.cx78D9BF, AppColors.cxFFBCFA.withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.cxFFBCFA.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.totalToCollect,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          _formatCurrency(totalAmount),
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cxBlack,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '${allPayments.length} ${l10n.paymentsToCollect}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      l10n.paymentsToCollect,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cxBlack,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemCount: allPayments.length,
                      itemBuilder: (context, index) {
                        final payment = allPayments[index];
                        final contract = _findContractForPayment(
                          state.collectables,
                          payment.contractId,
                        );

                        return _CollectableCard(
                          paymentId: payment.id,
                          customerName: contract?.user?.fullName ?? 'Unknown Customer',
                          amount: payment.amountRemaining,
                          dueDate: payment.dueDate,
                          contractId: payment.contractId,
                          status: payment.status,
                          daysOverdue: payment.daysOverdue,
                          paymentNumber: payment.paymentNumber,
                          productName: contract?.product?.name,
                          formatCurrency: _formatCurrency,
                          formatDate: _formatDate,
                          getStatusColor: _getStatusColor,
                          getStatusText: (status, daysOverdue, context) => _getStatusText(status, daysOverdue, context),
                          paymentMethods: state.paymentMethods,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _CollectableCard extends StatelessWidget {
  final String paymentId;
  final String customerName;
  final double amount;
  final String dueDate;
  final String contractId;
  final String status;
  final int daysOverdue;
  final int paymentNumber;
  final String? productName;
  final String Function(double) formatCurrency;
  final String Function(String) formatDate;
  final Color Function(String, int) getStatusColor;
  final String Function(String, int, BuildContext) getStatusText;
  final List<PaymentMethodModel> paymentMethods;

  const _CollectableCard({
    required this.paymentId,
    required this.customerName,
    required this.amount,
    required this.dueDate,
    required this.contractId,
    required this.status,
    required this.daysOverdue,
    required this.paymentNumber,
    this.productName,
    required this.formatCurrency,
    required this.formatDate,
    required this.getStatusColor,
    required this.getStatusText,
    required this.paymentMethods,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cxBlack,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Payment #$paymentNumber${productName != null ? ' - $productName' : ''}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: getStatusColor(status, daysOverdue).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  formatDate(dueDate),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: getStatusColor(status, daysOverdue),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: Colors.grey.shade200, height: 1),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.amount,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    formatCurrency(amount),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cx78D9BF,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    l10n.dueDate,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        formatDate(dueDate),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cxBlack,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final result = await showDialog<Map<String, dynamic>>(
                  context: context,
                  builder: (context) => CollectPaymentDialog(
                    amount: amount,
                    paymentMethods: paymentMethods,
                  ),
                );
                
                if (result != null && context.mounted) {
                  // Show loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.cx78D9BF,
                      ),
                    ),
                  );

                  // Record payment
                  final success = await context.read<CollectablesCubit>().recordPayment(
                    paymentId: paymentId,
                    amount: result['amount'],
                    paymentMethodId: result['payment_method_id'],
                    paymentDate: result['payment_date'],
                  );

                  // Close loading indicator
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    
                    final l10n = AppLocalizations.of(context);
                    // Show success or error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          success 
                            ? l10n.paymentRecordedSuccessfully
                            : l10n.failedToRecordPayment,
                        ),
                        backgroundColor: success ? AppColors.cx78D9BF : AppColors.cxFF8B92,
                      ),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cxBlack,
                foregroundColor: AppColors.cxWhite,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).collectPayment,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
