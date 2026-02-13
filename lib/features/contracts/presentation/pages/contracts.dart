import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../l10n/app_localizations.dart';
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

class ContractsView extends StatefulWidget {
  const ContractsView({super.key});

  @override
  State<ContractsView> createState() => _ContractsViewState();
}

class _ContractsViewState extends State<ContractsView> {
  Set<String> _seenContractIds = {};

  @override
  void initState() {
    super.initState();
    _loadSeenContracts();
  }

  Future<void> _loadSeenContracts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final seenIds = prefs.getStringList('seen_contract_ids') ?? [];
      setState(() {
        _seenContractIds = seenIds.toSet();
      });
    } catch (e) {
      print('Error loading seen contracts: $e');
    }
  }

  Future<void> _markContractsAsSeen(ContractsEntity contracts) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Get all contract IDs from the loaded contracts
      final allContractIds = <String>[];
      for (final group in contracts.contractGroups) {
        for (final contract in group.contracts) {
          allContractIds.add(contract.id);
        }
      }
      
      // Add new contract IDs to seen set
      final updatedSeenIds = {..._seenContractIds, ...allContractIds};
      
      // Calculate new contracts count (contracts not in seen set)
      final newContractsCount = allContractIds.where((id) => !_seenContractIds.contains(id)).length;
      
      // Save to SharedPreferences
      await prefs.setStringList('seen_contract_ids', updatedSeenIds.toList());
      await prefs.setInt('new_contracts_count', 0); // Reset badge count
      
      setState(() {
        _seenContractIds = updatedSeenIds;
      });
      
      print('✅ Marked ${newContractsCount} new contracts as seen');
    } catch (e) {
      print('Error marking contracts as seen: $e');
    }
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
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          AppLocalizations.of(context).myContracts,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<ContractCubit, ContractState>(
        builder: (context, state) {
          return state.when(
            initial: () => _buildShimmerLoading(),
            loading: () => _buildShimmerLoading(),
            loaded: (contracts) {
              // Mark contracts as seen when loaded
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _markContractsAsSeen(contracts);
              });
              return _buildContractsList(context, contracts);
            },
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 60.sp, color: Colors.red),
                  SizedBox(height: 16.h),
                  Text(
                    AppLocalizations.of(context).error,
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
                    child: Text(AppLocalizations.of(context).retry),
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
              AppLocalizations.of(context).noContractsFound,
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
        context.pushNamed(
          'contractDetails',
          extra: contract,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFAFAFA),
                      Colors.white,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    // Vehicle image/icon with enhanced styling
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: contract.vehicleImage != null
                            ? Image.network(
                                contract.vehicleImage!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFF5F7F9),
                                          Color(0xFFE8EAED),
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.directions_car_rounded,
                                      size: 32.sp,
                                      color: Color(0xFF6B7280),
                                    ),
                                  );
                                },
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFF5F7F9),
                                      Color(0xFFE8EAED),
                                    ],
                                  ),
                                ),
                                child: Icon(
                                  Icons.directions_car_rounded,
                                  size: 32.sp,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    // Contract details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contract.productName ?? contract.vehicleName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Icon(
                                Icons.person_outline_rounded,
                                size: 14.sp,
                                color: Color(0xFF9CA3AF),
                              ),
                              SizedBox(width: 4.w),
                              Expanded(
                                child: Text(
                                  '${contract.clientName} ${contract.clientId}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Status badge with enhanced styling
                    if (contract.status != null)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: _getStatusColor(contract.status!),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: _getStatusColor(contract.status!).withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          contract.status!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Additional contract information with refined design
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  border: Border(
                    top: BorderSide(
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    // Contract type
                    if (contract.contractType != null)
                      _buildInfoRow(
                        '${AppLocalizations.of(context).contractType}:',
                        _formatContractType(context, contract.contractType!),
                      ),
                    // Total service fee
                    if (contract.totalServiceFee != null)
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: _buildInfoRow(
                          '${AppLocalizations.of(context).serviceFee}:',
                          '${double.tryParse(contract.totalServiceFee!)?.toInt() ?? contract.totalServiceFee}',
                        ),
                      ),
                    // Collector name
                    if (contract.collectorFirstName != null || contract.collectorLastName != null)
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: _buildInfoRow(
                          '${AppLocalizations.of(context).collector}:',
                          '${contract.collectorFirstName ?? ''} ${contract.collectorLastName ?? ''}'.trim(),
                        ),
                      ),
                    // Service contract PDF link with enhanced styling
                    if (contract.serviceContractPdf != null)
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: GestureDetector(
                          onTap: () => _openPdf(contract.serviceContractPdf!),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              color: Color(0xFF4AC1A7).withOpacity(0.08),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: Color(0xFF4AC1A7).withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6.w),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4AC1A7).withOpacity(0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.picture_as_pdf_rounded,
                                    size: 16.sp,
                                    color: Color(0xFF4AC1A7),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Text(
                                    AppLocalizations.of(context).contractPdf,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color(0xFF4AC1A7),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 14.sp,
                                  color: Color(0xFF4AC1A7),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 12.w),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
              letterSpacing: -0.2,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  String _formatContractType(BuildContext context, String type) {
    switch (type.toLowerCase()) {
      case 'two_way':
        return AppLocalizations.of(context).twoWay;
      case 'three_way':
        return AppLocalizations.of(context).threeWay;
      default:
        return type;
    }
  }

  Future<void> _openPdf(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Color _getStatusColor(String status) {
    final lowerStatus = status.toLowerCase();
    
    // Active status - Premium Teal
    if (lowerStatus == 'active') {
      return Color(0xFF4AC1A7); // Premium teal
    } 
    // Finished status - Blue
    else if (lowerStatus == 'finished') {
      return Color(0xFF3B82F6); // Bright blue
    } 
    // Cancelled status - Red
    else if (lowerStatus == 'cancelled') {
      return Color(0xFFEF4444); // Vibrant red
    }
    // Returned status - Orange
    else if (lowerStatus == 'returned') {
      return Color(0xFFF59E0B); // Amber
    }
    
    // Default - Teal (for any unexpected status)
    return Color(0xFF4AC1A7);
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
