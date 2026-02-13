import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';
import 'package:intl/intl.dart';
import 'package:tezqu/core/shared/button_widget_iconless.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

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
  late PageController _pageController;
  int _currentImageIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
          // Image Banner Section - Swipeable Carousel
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            height: 240.h,
            child: product?.imageUrls != null && product!.imageUrls.isNotEmpty
                ? Stack(
                    children: [
                      // PageView for swipeable images
                      PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemCount: product!.imageUrls.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            decoration: BoxDecoration(
                              color: AppColors.cxF5F7F9,
                              borderRadius: BorderRadius.circular(24.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.r),
                              child: CachedNetworkImage(
                                imageUrl: product!.imageUrls[index],
                                width: double.infinity,
                                height: double.infinity,
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
                                    Icons.image_not_supported_outlined,
                                    size: 60.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // Image indicator dots
                      if (product!.imageUrls.length > 1)
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
                                width: _currentImageIndex == index ? 24.w : 8.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  color: _currentImageIndex == index 
                                      ? AppColors.cx43C19F 
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: AppColors.cxF5F7F9,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        size: 60.sp,
                        color: Colors.grey,
                      ),
                    ),
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
                  // Text(
                  //   product?.year ?? "",
                  //   style: TextStyle(
                  //     fontSize: 18.sp,
                  //     fontWeight: FontWeight.w600,
                  //     color: AppColors.cx43C19F,
                  //   ),
                  // ),
                  SizedBox(height: 4.h),
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
                    ...product!.customFields!.entries
                        .where((entry) => 
                            entry.key != 'type' && 
                            entry.key != 'vin' &&
                            entry.key != 'avtomobil_modeli' &&
                            entry.key != 'avtomobil_brendi')
                        .map((entry) {
                      String displayKey = entry.key;
                      dynamic displayValue = entry.value;
                      
                      if (entry.key == 'avtomobil_raqami') {
                        displayKey = AppLocalizations.of(context).plateNumber;
                        // Extract 'number' field if value is a Map
                        if (entry.value is Map) {
                          displayValue = entry.value['number'] ?? entry.value;
                        }
                      } else if (entry.key == 'avtomobil_xolati') {
                        displayKey = AppLocalizations.of(context).carCondition;
                      } else if (entry.key == 'yurgan_masofasi') {
                        displayKey = AppLocalizations.of(context).mileage;
                      } else if (entry.key == 'yoqilgi_turi'){
                        displayKey = AppLocalizations.of(context).fuelType;
                      }else if (entry.key == 'rangi'){
                        displayKey = AppLocalizations.of(context).color;
                      }else if (entry.key == 'uzatmalar_qutisi'){
                        displayKey = AppLocalizations.of(context).transmissionType;
                      }else if (entry.key == 'yili'){
                        displayKey = AppLocalizations.of(context).year;
                      }
                      
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
                                "$displayKey - $displayValue",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.cxBlack,
                                  fontWeight: FontWeight.w400,
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
                  12.verticalSpace,
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
                                "\$ ${NumberFormat('#,###', 'en_US').format(double.tryParse(product!.price)?.toInt() ?? 0).replaceAll(',', ' ')}",
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
            padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                    barrierColor: Colors.black.withOpacity(0.5),
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 40,
                                offset: Offset(0, 20),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.fromLTRB(32.w, 32.h, 32.w, 24.h),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFF8F9FA),
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 56.w,
                                        height: 56.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFF4AC1A7),
                                              Color(0xFF43C19F),
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF4AC1A7).withOpacity(0.3),
                                              blurRadius: 16,
                                              offset: Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.shopping_bag_outlined,
                                          color: Colors.white,
                                          size: 28.sp,
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        AppLocalizations.of(context).toPurchase,
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1A1A1A),
                                          letterSpacing: -0.5,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        AppLocalizations.of(context).contactMethod,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF6B7280),
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 32.h),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: _isSubmittingRequest ? null : _submitProductRequest,
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF1A1A1A),
                                                Color(0xFF2D2D2D),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(16.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(0.15),
                                                blurRadius: 20,
                                                offset: Offset(0, 10),
                                              ),
                                            ],
                                          ),
                                          child: _isSubmittingRequest
                                              ? Center(
                                                  child: SizedBox(
                                                    width: 24.w,
                                                    height: 24.h,
                                                    child: CircularProgressIndicator(
                                                      strokeWidth: 2.5,
                                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                    ),
                                                  ),
                                                )
                                              : Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.send_rounded,
                                                      color: Colors.white,
                                                      size: 20.sp,
                                                    ),
                                                    SizedBox(width: 12.w),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          AppLocalizations.of(context).sendRequest,
                                                          style: TextStyle(
                                                            fontSize: 17.sp,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.white,
                                                            letterSpacing: -0.3,
                                                          ),
                                                        ),
                                                        SizedBox(height: 2.h),
                                                        Text(
                                                          AppLocalizations.of(context).contactMe,
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight: FontWeight.w400,
                                                            color: Colors.white.withOpacity(0.7),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                      SizedBox(height: 12.h),
                                      GestureDetector(
                                        onTap: _makePhoneCall,
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF8F9FA),
                                            borderRadius: BorderRadius.circular(16.r),
                                            border: Border.all(
                                              color: Color(0xFFE5E7EB),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8.w),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF4AC1A7).withOpacity(0.1),
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.phone_rounded,
                                                  color: Color(0xFF4AC1A7),
                                                  size: 18.sp,
                                                ),
                                              ),
                                              SizedBox(width: 12.w),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppLocalizations.of(context).callMyself,
                                                    style: TextStyle(
                                                      fontSize: 17.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: Color(0xFF1A1A1A),
                                                      letterSpacing: -0.3,
                                                    ),
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Text(
                                                    AppLocalizations.of(context).callCenter,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFF6B7280),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
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