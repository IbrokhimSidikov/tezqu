import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../domain/entities/contract_entity.dart';
import '../cubit/contract_cubit.dart';
import '../cubit/contract_state.dart';

class ContractsPage extends StatelessWidget {
  const ContractsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ContractCubit>()..loadContracts(),
      child: const ContractsView(),
    );
  }
}

class ContractsView extends StatelessWidget {
  const ContractsView({super.key});

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
          'Shartnomalarim',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<ContractCubit, ContractState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildShimmerLoading(),
            loading: () => _buildShimmerLoading(),
            loaded: (contracts) => _buildContractsList(context, contracts),
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
                      context.read<ContractCubit>().loadContracts();
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

  Widget _buildContractsList(BuildContext context, ContractsEntity contracts) {
    if (contracts.contractGroups.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description_outlined,
              size: 80.sp,
              color: AppColors.cxDADADA,
            ),
            SizedBox(height: 16.h),
            Text(
              'Shartnomalar topilmadi',
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.cxAFB1B1,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ContractCubit>().loadContracts();
      },
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: contracts.contractGroups.length,
        itemBuilder: (context, groupIndex) {
          final group = contracts.contractGroups[groupIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date header
              Padding(
                padding: EdgeInsets.only(bottom: 16.h, top: groupIndex > 0 ? 24.h : 0),
                child: Text(
                  group.date,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.cxAFB1B1,
                  ),
                ),
              ),
              // Contracts for this date
              ...group.contracts.map((contract) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: _buildContractItem(context, contract),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContractItem(BuildContext context, ContractItemEntity contract) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to contract details
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Vehicle image/icon
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.cxF5F7F9,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: contract.vehicleImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        contract.vehicleImage!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.directions_car,
                            size: 30.sp,
                            color: AppColors.cxBlack,
                          );
                        },
                      ),
                    )
                  : Icon(
                      Icons.directions_car,
                      size: 30.sp,
                      color: AppColors.cxBlack,
                    ),
            ),
            SizedBox(width: 16.w),
            // Contract details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contract.vehicleName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${contract.clientName} ${contract.clientId}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                  ),
                ],
              ),
            ),
            // Status badge (if available)
            if (contract.status != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(contract.status!),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  contract.status!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    final lowerStatus = status.toLowerCase();
    if (lowerStatus.contains('yangi') || lowerStatus.contains('new')) {
      return Colors.green;
    } else if (lowerStatus.contains('aktiv') || lowerStatus.contains('active')) {
      return AppColors.cx78D9BF;
    } else if (lowerStatus.contains('tugallangan') || lowerStatus.contains('completed')) {
      return Colors.grey;
    }
    return AppColors.cx78D9BF;
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      itemCount: 3,
      itemBuilder: (context, groupIndex) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date shimmer
            Padding(
              padding: EdgeInsets.only(bottom: 16.h, top: groupIndex > 0 ? 24.h : 0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 120.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
            // Contract items shimmer
            ...List.generate(2, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: _buildShimmerItem(),
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(16.w),
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
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 150.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
