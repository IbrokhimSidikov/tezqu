import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
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
          'To\'lovlarim',
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
            initial: () => const Center(child: Text('Initializing...')),
            loading: () => const Center(child: CircularProgressIndicator()),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keyingi to\'lovlarim',
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
                          'Keyingi to\'lovlar yo\'q',
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
                          payment,
                          isPaid: false,
                        ),
                      );
                    }).toList(),

                  SizedBox(height: 24.h),

                  // Payment history section
                  Text(
                    'To\'lovlarim tarixi',
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
                          'To\'lovlar tarixi yo\'q',
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
                          payment,
                          isPaid: true,
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

  Widget _buildPaymentItem(PaymentEntity payment, {required bool isPaid}) {
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

    return InkWell(
      onTap: () {
        // TODO: Navigate to payment details
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
                    payment.productName,
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
}
