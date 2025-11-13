import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/contract_entity.dart';

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
        body: const Center(
          child: Text('Shartnoma topilmadi'),
        ),
      );
    }

    // Create a list of images (for now, we'll use the single image if available)
    final List<String> images = contract.vehicleImage != null 
        ? [contract.vehicleImage!] 
        : [];

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
                    'Shartnoma asosiy shartlari',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  
                  _buildDetailItem('Sotuvchi', '${contract.collectorFirstName ?? ''} ${contract.collectorLastName ?? ''}'.trim().isEmpty 
                      ? 'Bahrom Ismoilov ID 2382' 
                      : '${contract.collectorFirstName ?? ''} ${contract.collectorLastName ?? ''}'.trim()),
                  _buildDetailItem('Boshlang\'ich to\'lov', '10.000\$'),
                  _buildDetailItem('Narx', contract.totalServiceFee != null ? '${contract.totalServiceFee} so\'m' : '55.000\$'),
                  _buildDetailItem('Kafil shaxs', 'Shoqosim Komolov'),
                  _buildDetailItem('Guvoh', 'Adham Mamajonov'),
                  
                  SizedBox(height: 24.h),
                  
                  // Payment Info Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          'Kelishuv',
                          'Oyiga: 200\$',
                          'Muddat: 14 oy',
                          AppColors.cxF5F7F9,
                          AppColors.cx78D9BF,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildInfoCard(
                          'PDF',
                          'Shartnoma',
                          'No.32211',
                          AppColors.cxF5F7F9,
                          AppColors.cxAFB1B1,
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
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.directions_car,
                          size: 80.sp,
                          color: AppColors.cxAFB1B1,
                        ),
                      );
                    },
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
              onPressed: () {
                // Handle reject action
                _showRejectDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF4E6),
                foregroundColor: const Color(0xFFFF9800),
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Rad etish',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Handle approve action
                _showApproveDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cxBlack,
                foregroundColor: AppColors.cxWhite,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Tasdiqlash',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rad etish'),
        content: const Text('Shartnomani rad etishni xohlaysizmi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Bekor qilish'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement reject logic here
            },
            child: const Text('Rad etish'),
          ),
        ],
      ),
    );
  }

  void _showApproveDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tasdiqlash'),
        content: const Text('Shartnomani tasdiqlashni xohlaysizmi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Bekor qilish'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement approve logic here
            },
            child: const Text('Tasdiqlash'),
          ),
        ],
      ),
    );
  }
}
