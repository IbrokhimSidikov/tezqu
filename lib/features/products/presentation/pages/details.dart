import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:tezqu/core/shared/button_widget_iconless.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/wishlist_service.dart';
import '../../../../core/services/product_request_service.dart';
import '../../data/models/product_model.dart';

class Details extends StatefulWidget {
  final dynamic product;
  
  const Details({super.key, this.product});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  ProductModel? get product => widget.product as ProductModel?;
  bool _isFavorite = false;
  bool _isLoading = true;
  bool _isSubmittingRequest = false;
  
  @override
  void initState() {
    super.initState();
    _checkWishlistStatus();
    // Log product data when page loads
    print('=== DETAILS PAGE LOADED ===');
    print('Product received: ${widget.product}');
    print('Product type: ${widget.product.runtimeType}');
    if (product != null) {
      print('Product ID: ${product!.id}');
      print('Product Name: ${product!.name}');
      print('Product Year: ${product!.year}');
      print('Product Price: ${product!.price}');
      print('Product Status: ${product!.status}');
      print('Product Details: ${product!.details}');
      print('Product Images: ${product!.imageUrls}');
    } else {
      print('ERROR: Product is NULL!');
    }
    print('========================');
  }

  Future<void> _checkWishlistStatus() async {
    if (product != null) {
      try {
        final isInWishlist = await getIt<WishlistService>().isInWishlist(product!.id);
        if (mounted) {
          setState(() {
            _isFavorite = isInWishlist;
            _isLoading = false;
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  Future<void> _submitProductRequest() async {
    if (product == null || _isSubmittingRequest) return;

    setState(() {
      _isSubmittingRequest = true;
    });

    try {
      await getIt<ProductRequestService>().createProductRequest(product!.id);
      if (mounted) {
        setState(() {
          _isSubmittingRequest = false;
        });
        Navigator.of(context).pop(); // Close the purchase dialog
        _showSuccessDialog(context);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSubmittingRequest = false;
        });
        Navigator.of(context).pop(); // Close the purchase dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${AppLocalizations.of(context).errorOccurred}: ${e.toString()}'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _makePhoneCall() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '889984444');
    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppLocalizations.of(context).cannotOpenPhone),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).errorOccurred),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cxWhite,
      body: Column(
        children: [
          // Status bar area
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cxF5F7F9,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cxF5F7F9,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        if (product != null) {
                          try {
                            if (_isFavorite) {
                              // Remove from wishlist
                              await getIt<WishlistService>().removeFromWishlist(product!.id);
                              if (mounted) {
                                setState(() {
                                  _isFavorite = false;
                                });
                              }
                            } else {
                              // Add to wishlist
                              await getIt<WishlistService>().addToWishlist(product!.id);
                              if (mounted) {
                                setState(() {
                                  _isFavorite = true;
                                });
                              }
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(AppLocalizations.of(context).errorOccurred),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Image Banner Section
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            height: 240.h,
            decoration: BoxDecoration(
              color: AppColors.cxF5F7F9,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: product?.imageUrl != null && product!.imageUrl!.isNotEmpty
                      ? Image.network(
                          product!.imageUrl!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              size: 60.sp,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            size: 60.sp,
                            color: Colors.grey,
                          ),
                        ),
                ),
                // Image indicator dots
                if (product?.imageUrls != null && product!.imageUrls.length > 1)
                  Positioned(
                    bottom: 16.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        product!.imageUrls.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.w),
                          width: index == 0 ? 24.w : 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: index == 0 ? AppColors.cx43C19F : Colors.grey[300],
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Content Section
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product?.name ?? AppLocalizations.of(context).productName,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Model/Year in green
                  Text(
                    product?.year ?? "",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cx43C19F,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Product Details Section
                  Text(
                    AppLocalizations.of(context).productAbout,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cxBlack,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // Custom fields as bullet points
                  if (product?.customFields != null)
                    ...product!.customFields!.entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 6.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "• ",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.cxBlack,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${entry.key} - ${entry.value}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.cxBlack,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  if (product?.details != null && product!.details.isNotEmpty) ...[
                    SizedBox(height: 8.h),
                    Text(
                      product!.details,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.cx6B7280,
                        height: 1.5,
                      ),
                    ),
                  ],
                  // Pricing Section
                  Row(
                    children: [
                      // Cash Price
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: AppColors.cxF5F7F9,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).cashPrice,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.cxBlack,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "\$${product?.price ?? '0'}",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cx43C19F,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      // Installment
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: AppColors.cxF5F7F9,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).installment,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.cxBlack,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                AppLocalizations.of(context).installmentPeriod,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.cx6B7280,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Fixed Bottom Button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: ButtonWidgetIconless(
                text: AppLocalizations.of(context).placeOrder,
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: AppColors.cxWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        insetPadding: EdgeInsets.all(20.w), // margin from screen edges
                        child: Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).toPurchase,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 36.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: _isSubmittingRequest ? null : _submitProductRequest,
                                      child: Container(
                                        width: 150.w,
                                        height: 100.h,
                                        padding: EdgeInsets.symmetric(vertical: 12.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.cxFEDA84,
                                          borderRadius: BorderRadius.circular(25.r),
                                        ),
                                        child: Column(
                                          children: [
                                            _isSubmittingRequest
                                                ? SizedBox(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    child: CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                                    ),
                                                  )
                                                : Text(
                                                    AppLocalizations.of(context).sendRequest,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 20.sp,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                            SizedBox(height: 6.h),
                                            Text(
                                              AppLocalizations.of(context).contactMe,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: _makePhoneCall,
                                      child: Container(
                                        width: 150.w,
                                        height: 100.h,
                                        padding: EdgeInsets.symmetric(vertical: 12.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.cxF7F6F9,
                                          borderRadius: BorderRadius.circular(25.r),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context).callMyself,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 6.h),
                                            Text(
                                              AppLocalizations.of(context).callCenter,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500

                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColors.cxWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        insetPadding: EdgeInsets.all(20.sp),
        child: SizedBox(
          width: 360.w,
          height: 214.h,
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                 alignment: Alignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context).requestReceived,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(); // closes current dialog
                          Navigator.of(context).pop(); // closes one more (previous)
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.close, size: 22.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding:EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.cx43C19F, width: 3.w),
                  ),
                  child: Iconify(Tabler.icons, size: 40.sp, color: AppColors.cx43C19F),
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context).requestReceivedMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}