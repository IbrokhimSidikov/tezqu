import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tezqu/core/shared/app_banner.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/di/di.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../products/data/models/product_model.dart';
import '../../../products/domain/repositories/product_repository.dart';
import '../../domain/entities/payment_entity.dart';

class DetailsPayment extends StatefulWidget {
  final int contractId;
  final PaymentEntity? payment;
  final PaymentsEntity? allPayments;
  
  const DetailsPayment({super.key, required this.contractId, this.payment, this.allPayments});

  @override
  State<DetailsPayment> createState() => _DetailsPaymentState();
}

class _DetailsPaymentState extends State<DetailsPayment> {
  ProductModel? _productDetails;
  bool _isLoadingProduct = false;

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  Future<void> _fetchProductDetails() async {
    final productId = widget.payment?.contract?.productId;
    if (productId == null || productId.isEmpty) return;

    // Skip if already loaded
    if (_productDetails != null) return;

    setState(() {
      _isLoadingProduct = true;
    });

    final productRepository = getIt<ProductRepository>();
    final result = await productRepository.getProductById(productId);

    result.fold(
      (failure) {
        if (mounted) {
          setState(() {
            _isLoadingProduct = false;
          });
        }
      },
      (product) {
        if (mounted) {
          setState(() {
            _productDetails = product;
            _isLoadingProduct = false;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cxWhite,
      appBar: AppBar(
        backgroundColor: AppColors.cxWhite,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF5F7F9),
            ),
            child: IconButton(
              iconSize: 29.sp,
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(AppLocalizations.of(context).paymentDetails, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
      ),
      body: Padding(
          padding: EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 16.0, right: 20.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(),
              // SizedBox(height: 22.h),
              // Display contract ID for debugging
              if (widget.payment != null)
                Text(
                  widget.payment!.productName,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.cxBlack,
                  ),
                ),
              // SizedBox(height: 4.h),
              // Text(
              //   '${AppLocalizations.of(context).contractId}: ${widget.contractId}',
              //   style: TextStyle(
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.w400,
              //     color: AppColors.cxAFB1B1,
              //   ),
              // ),
              SizedBox(height: 12.h),
              // Product Name from API
              if (_productDetails?.name != null) ...[
                Text(
                  _productDetails!.name,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 16.h),
              ],
              // Custom Fields
              if (_productDetails?.customFields != null && _productDetails!.customFields!.isNotEmpty) ...[
                ..._buildCustomFields(),
                SizedBox(height: 16.h),
              ],
              SizedBox(height: 8.h),
              Expanded(
                child: Column(
                  children: [
                    ..._buildPaymentTimeline(),
                    32.verticalSpace,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: widget.payment?.contract?.serviceContractPdf != null
                                ? () => _openPdf(widget.payment!.contract!.serviceContractPdf!)
                                : null,
                            child: Container(
                              width: 172.w,
                              height: 126.h,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.cxF7F6F9,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('PDF',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  SizedBox(height: 2.h),
                                  Text(AppLocalizations.of(context).contract,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: widget.payment?.contract?.serviceContractPdf != null 
                                              ? AppColors.cx78D9BF 
                                              : AppColors.cxAFB1B1
                                      )),
                                  SizedBox(height: 2.h),
                                  Text(
                                      widget.payment?.contract?.serviceContractPdf != null 
                                          ? 'Ko\'rish' 
                                          : 'Mavjud emas',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: widget.payment?.contract?.serviceContractPdf != null 
                                              ? AppColors.cx78D9BF 
                                              : AppColors.cxAFB1B1
                                      )),
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white, width: 2),
                                      ),
                                      child: CircleAvatar(
                                        radius: 18.r,
                                        backgroundColor: widget.payment?.contract?.serviceContractPdf != null 
                                            ? AppColors.cxFEC700 
                                            : AppColors.cxAFB1B1,
                                        child: Icon(Icons.file_copy_outlined, color: Colors.black, size: 18.sp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 172.w,
                            height: 126.h,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.cxF7F6F9,
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context).contract,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text('To\'lov:',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.cxAFB1B1
                                    )),
                                Text('Har oy:',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.cxAFB1B1
                                    )),
                                Text('Muddat:',
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.cxAFB1B1
                                    )),
                              ],
                            ),
                          ),
                        ]
                    )
                  ],
                ),
              ),
            ]
          )
      ),
    );
  }

  Widget _buildTimelineItem(String date, String amount, bool isPaid, bool isFirst, bool showBottomLine) {
    return Container(
      height: 60.h,
      child: Row(
        children: [
          Column(
            children: [
              if (!isFirst && isPaid)
                Container(
                  width: 2.w,
                  height: 20.h,
                  color: AppColors.cx43C19F,
                ),
              if (!isFirst && !isPaid)
                SizedBox(
                  width: 2.w,
                  height: 20.h,
                ),
              Container(
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                  color: isPaid ? AppColors.cx43C19F : Colors.grey.shade300,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isPaid ? AppColors.cx43C19F : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: isPaid
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10.sp,
                      )
                    : null,
              ),
              if (showBottomLine)
                Expanded(
                  child: Container(
                    width: 2.w,
                    color: AppColors.cx43C19F,
                  ),
                ),
              if (!showBottomLine)
                Expanded(
                  child: SizedBox(width: 2.w),
                ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: isPaid ? AppColors.cxBlack : AppColors.cxB0B0B0,
                  ),
                ),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: isPaid ? AppColors.cxBlack : AppColors.cxB0B0B0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPaymentTimeline() {
    if (widget.allPayments == null || widget.payment == null) {
      return [
        _buildTimelineItem('--', '\$0', false, true, false),
      ];
    }

    // Get the product ID from the current payment's contract
    final currentProductId = widget.payment!.contract?.productId;
    
    // Filter by product_id from contract to ensure we only show payments for this specific product
    final paidPayments = widget.allPayments!.paidPayments
        .where((p) => p.contract?.productId != null && p.contract?.productId == currentProductId)
        .toList();
    final nextPayments = widget.allPayments!.nextPayments
        .where((p) => p.contract?.productId != null && p.contract?.productId == currentProductId)
        .toList();

    // Sort paid payments by date (oldest to newest for top to bottom)
    paidPayments.sort((a, b) => a.dueDate.compareTo(b.dueDate));
    // Sort next payments by date (oldest to newest)
    nextPayments.sort((a, b) => a.dueDate.compareTo(b.dueDate));

    if (paidPayments.isEmpty && nextPayments.isEmpty) {
      return [
        _buildTimelineItem('--', '\$0', false, true, false),
      ];
    }

    final List<Widget> timelineWidgets = [];

    // Add paid payments (connected)
    for (int i = 0; i < paidPayments.length; i++) {
      final payment = paidPayments[i];
      final isFirst = i == 0;
      final isLast = i == paidPayments.length - 1;
      
      timelineWidgets.add(
        _buildTimelineItem(
          _formatDate(payment.dueDate),
          '\$${payment.amount.toStringAsFixed(2)}',
          true,
          isFirst,
          !isLast, // Show bottom line if not last paid payment
        ),
      );
    }

    // Add next payments (not connected)
    for (int i = 0; i < nextPayments.length; i++) {
      final payment = nextPayments[i];
      final isFirst = i == 0 && paidPayments.isEmpty;
      
      timelineWidgets.add(
        _buildTimelineItem(
          _formatDate(payment.dueDate),
          '\$${payment.amount.toStringAsFixed(2)}',
          false,
          isFirst,
          false, // No bottom line for next payments
        ),
      );
    }

    return timelineWidgets;
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
    } catch (e) {
      return dateStr;
    }
  }

  List<Widget> _buildCustomFields() {
    if (_productDetails?.customFields == null || _productDetails!.customFields!.isEmpty) {
      return [];
    }

    final customFields = _productDetails!.customFields!;
    final List<Widget> fieldWidgets = [];

    customFields.forEach((key, value) {
      if (value != null && value.toString().isNotEmpty) {
        fieldWidgets.add(
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$key: ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.cxAFB1B1,
                  ),
                ),
                Expanded(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cxBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });

    return fieldWidgets;
  }

  String _calculateRemainingAmount() {
    if (widget.allPayments == null || widget.payment == null) return '0.00';

    // Get the product ID from the current payment's contract
    final currentProductId = widget.payment!.contract?.productId;
    
    final allContractPayments = [
      ...widget.allPayments!.paidPayments.where((p) => p.contract?.productId == currentProductId),
      ...widget.allPayments!.nextPayments.where((p) => p.contract?.productId == currentProductId),
    ];

    final remaining = allContractPayments
        .where((p) => p.status.toLowerCase() != 'paid')
        .fold<double>(0.0, (sum, payment) => sum + payment.amount);

    return remaining.toStringAsFixed(2);
  }

  Future<void> _openPdf(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildProductImage() {
    if (_isLoadingProduct) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 180.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      );
    }

    final imageUrl = _productDetails?.imageUrls.isNotEmpty == true 
        ? _productDetails!.imageUrls.first 
        : null;

    if (imageUrl != null && imageUrl.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 180.h,
          width: double.infinity,
          fit: BoxFit.cover,
          memCacheHeight: (180 * 2.75).toInt(), // Cache at 2.75x for high DPI screens
          memCacheWidth: (MediaQuery.of(context).size.width * 2.75).toInt(),
          maxHeightDiskCache: (180 * 2.75).toInt(),
          maxWidthDiskCache: (MediaQuery.of(context).size.width * 2.75).toInt(),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            height: 180.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cxF5F7F9,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_not_supported, size: 48.sp, color: AppColors.cxAFB1B1),
                SizedBox(height: 8.h),
                Text(
                  'Image not available',
                  style: TextStyle(color: AppColors.cxAFB1B1, fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Fallback to static banner if no product image
    return AppBanner(image: AppImages.reklama);
  }
}
