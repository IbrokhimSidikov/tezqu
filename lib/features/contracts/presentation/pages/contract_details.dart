import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/contract_entity.dart';
import '../cubit/contract_cubit.dart';

class ContractDetails extends StatefulWidget {
  final ContractItemEntity? contract;
  
  const ContractDetails({super.key, this.contract});

  @override
  State<ContractDetails> createState() => _ContractDetailsState();
}

class _ContractDetailsState extends State<ContractDetails> {
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contract = widget.contract;


    if (contract == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.cxWhite,
        ),
        body: Center(
          child: Text(AppLocalizations.of(context).contractNotFound),
        ),
      );
    }

    // Use product image URLs if available, otherwise fall back to vehicle image
    final List<String> images = contract.productImageUrls ?? 
        (contract.vehicleImage != null ? [contract.vehicleImage!] : []);

    return Scaffold(
      backgroundColor: AppColors.cxWhite,
      appBar: AppBar(
        backgroundColor: AppColors.cxWhite,
        elevation: 0,
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  
                  // Image Carousel
                  _buildImageCarousel(images),
                  
                  SizedBox(height: 24.h),
                  
                  // Contract Name and Number
                  Text(
                    contract.productName ?? contract.vehicleName,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'SL03',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.cx78D9BF,
                    ),
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Contract Details Section
                  Text(
                    AppLocalizations.of(context).mainContractTerms,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  
                  // Sotuvchi (Seller/Collector)
                  if (contract.collectorFirstName != null || contract.collectorLastName != null)
                    _buildDetailItem(AppLocalizations.of(context).collector, '${contract.collectorFirstName ?? ''} ${contract.collectorLastName ?? ''}'.trim()),
                  
                  // Boshlang'ich to'lov (Initial Payment)
                  if (contract.initialPayment != null)
                    _buildDetailItem(AppLocalizations.of(context).initialPayment, '${contract.initialPayment} USD'),
                  
                  // Narx (Price from product)
                  if (contract.productPrice != null)
                    _buildDetailItem(AppLocalizations.of(context).price, '${contract.productPrice} USD'),
                  
                  // Mijoz (Customer/User)
                  if (contract.userFirstName != null || contract.userLastName != null)
                    _buildDetailItem(AppLocalizations.of(context).customer, '${contract.userFirstName ?? ''} ${contract.userLastName ?? ''}'.trim()),
                  
                  // Tasdiqlagan admin (Approved by admin)
                  if (contract.approvedByAdminFirstName != null || contract.approvedByAdminLastName != null)
                    _buildDetailItem(AppLocalizations.of(context).approvedBy, '${contract.approvedByAdminFirstName ?? ''} ${contract.approvedByAdminLastName ?? ''}'.trim()),
                  
                  SizedBox(height: 24.h),
                  
                  // Payment Info Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          AppLocalizations.of(context).agreement,
                          '${AppLocalizations.of(context).monthly}: ${contract.monthlyPayment ?? "0"} USD',
                          '${AppLocalizations.of(context).period}: ${contract.installmentPeriodMonths ?? 0} ${AppLocalizations.of(context).months}',
                          AppColors.cxF5F7F9,
                          AppColors.cx78D9BF,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: contract.serviceContractPdf != null
                              ? () => _openPdf(contract.serviceContractPdf!)
                              : null,
                          child: _buildInfoCard(
                            'PDF',
                            AppLocalizations.of(context).contract,
                            contract.serviceContractPdf != null ? AppLocalizations.of(context).view : AppLocalizations.of(context).notAvailable,
                            AppColors.cxF5F7F9,
                            contract.serviceContractPdf != null ? AppColors.cx78D9BF : AppColors.cxAFB1B1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 100.h), // Space for bottom buttons
                ],
              ),
            ),
          ),
          
          // Bottom Action Buttons
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(List<String> images) {
    if (images.isEmpty) {
      return Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: AppColors.cxF5F7F9,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: Icon(
            Icons.directions_car,
            size: 80.sp,
            color: AppColors.cxAFB1B1,
          ),
        ),
      );
    }

    return Column(
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                  color: AppColors.cxF5F7F9,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 80.sp,
                        color: AppColors.cxAFB1B1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        if (images.length > 1) ...[
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImageIndex == index
                      ? AppColors.cx78D9BF
                      : AppColors.cxDADADA,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 6.w,
            height: 6.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.cxBlack,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.cxBlack,
                ),
                children: [
                  TextSpan(
                    text: '$label - ',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String line1, String line2, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.cxBlack,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            line1,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            line2,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    final contract = widget.contract;
    final isUserAccepted = contract?.userAccepted ?? false;
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: isUserAccepted ? null : () {
                _showRejectDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isUserAccepted ? AppColors.cxAFB1B1 : AppColors.cxFEDA84,
                foregroundColor: AppColors.cxBlack,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                disabledBackgroundColor: AppColors.cxAFB1B1,
                disabledForegroundColor: AppColors.cxBlack.withValues(alpha: 0.5),
              ),
              child: Text(
                AppLocalizations.of(context).reject,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ElevatedButton(
              onPressed: isUserAccepted ? null : () {
                // Handle approve action
                _showApproveDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isUserAccepted ? AppColors.cxAFB1B1 : AppColors.cxBlack,
                foregroundColor: AppColors.cxWhite,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                disabledBackgroundColor: AppColors.cxAFB1B1,
                disabledForegroundColor: AppColors.cxWhite.withValues(alpha: 0.5),
              ),
              child: Text(
                AppLocalizations.of(context).approve,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openPdf(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showRejectDialog() {
    final contract = widget.contract;
    if (contract == null) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(AppLocalizations.of(context).rejectContract),
        content: Text(AppLocalizations.of(context).rejectContractConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(AppLocalizations.of(context).cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              
              // Show loading indicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );

              // Call reject API
              final cubit = getIt<ContractCubit>();
              final success = await cubit.rejectContractAction(contract.id);
              
              // Hide loading
              if (mounted) Navigator.pop(context);
              
              if (success) {
                // Show success message
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context).contractRejected),
                      backgroundColor: Colors.green,
                    ),
                  );
                  // Go back to contracts list
                  Navigator.pop(context);
                }
              } else {
                // Show error message
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context).error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Text(AppLocalizations.of(context).reject),
          ),
        ],
      ),
    );
  }

  void _showApproveDialog() {
    final contract = widget.contract;
    if (contract == null) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(AppLocalizations.of(context).approveContract),
        content: Text(AppLocalizations.of(context).approveContractConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(AppLocalizations.of(context).cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              
              // Show loading indicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );

              // Call accept API
              final cubit = getIt<ContractCubit>();
              final success = await cubit.acceptContractAction(contract.id);
              
              // Hide loading
              if (mounted) Navigator.pop(context);
              
              if (success) {
                // Show success message
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context).contractApproved),
                      backgroundColor: Colors.green,
                    ),
                  );
                  // Go back to contracts list
                  Navigator.pop(context);
                }
              } else {
                // Show error message
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppLocalizations.of(context).error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            child: Text(AppLocalizations.of(context).approve),
          ),
        ],
      ),
    );
  }
}
