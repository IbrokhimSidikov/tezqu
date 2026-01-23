import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/app_banner.dart';
import '../../../../core/shared/skeleton_loader.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/product_model.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';
import 'details.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late final ProductCubit _productCubit;

  @override
  void initState() {
    super.initState();
    _productCubit = getIt<ProductCubit>()..initialize();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _productCubit.close();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _productCubit.clearSearch();
      } else {
        _searchFocusNode.requestFocus();
      }
    });
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'sold':
        return 'Sotildi';
      case 'available':
      case 'active':
        return 'Active';
      default:
        return 'Active';
    }
  }

  String _buildProductSubtitle(ProductModel product) {
    List<String> parts = [];
    
    // Add year if available
    if (product.year.isNotEmpty) {
      parts.add(product.year);
    }
    
    // Add custom fields if available
    if (product.customFields != null) {
      final fields = product.customFields!;
      
      // Add color (Rangi)
      if (fields['Rangi'] != null) {
        parts.add(fields['Rangi'].toString());
      }
      
      // Add mileage/distance (Probeg or Masofa)
      if (fields['Probeg'] != null) {
        parts.add('${fields['Probeg']}km');
      } else if (fields['Masofa'] != null) {
        parts.add(fields['Masofa'].toString());
      }
      
      // Add other relevant fields
      if (fields['Model'] != null) {
        parts.add(fields['Model'].toString());
      }
    }
    
    return parts.isNotEmpty ? parts.join(', ') : 'No details';
  }

  Widget _buildProductCard(BuildContext context, ProductModel product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(product: product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Circular product image
            Container(
              width: 70.w,
              height: 70.w,
              decoration: BoxDecoration(
                color: AppColors.cxF5F7F9,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: product.imageUrl != null && product.imageUrl!.isNotEmpty
                    ? Image.network(
                        product.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.image_not_supported_outlined,
                          size: 30.sp,
                          color: Colors.grey,
                        ),
                      )
                    : Icon(
                        Icons.image_not_supported_outlined,
                        size: 30.sp,
                        color: Colors.grey,
                      ),
              ),
            ),
            SizedBox(width: 12.w),
            // Product info - flexible middle section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cxBlack,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _buildProductSubtitle(product),
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.cx6B7280,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            // Price and status - right section
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cxBlack,
                  ),
                ),
                SizedBox(height: 6.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: (product.status.toLowerCase() == 'available' || 
                           product.status.toLowerCase() == 'active')
                        ? Color(0xFF4CAF50)
                        : Color(0xFFFF5252),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    _getStatusText(product.status),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _productCubit,
      child: Scaffold(
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
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(AppLocalizations.of(context).products, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
        actions: [
          if (!_isSearching)
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cxF5F7F9,
                ),
                child: IconButton(
                  iconSize: 29.sp,
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: _toggleSearch,
                ),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 16.0, right: 20.0),
        child: Column(
          children: [
            AppBanner(image: AppImages.reklama),
            SizedBox(height: 30.h),
            
            // Error message
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductError) {
                  // Check if it's an unauthorized error
                  if (state.message.toLowerCase().contains('unauthorized')) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Iltimos, tizimga kiring'),
                          backgroundColor: Colors.red,
                          action: SnackBarAction(
                            label: 'Kirish',
                            textColor: Colors.white,
                            onPressed: () {
                              context.go(AppRoutes.login);
                            },
                          ),
                        ),
                      );
                    });
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        Text(
                          state.message,
                          style: TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        if (state.message.toLowerCase().contains('unauthorized'))
                          TextButton(
                            onPressed: () {
                              context.go(AppRoutes.login);
                            },
                            child: Text('Tizimga kirish'),
                          ),
                      ],
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
            // Search bar or title row
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuart,
              child: _isSearching
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, size: 24.sp, color: Colors.grey),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              focusNode: _searchFocusNode,
                              decoration: InputDecoration(
                                hintText: 'Qidirish...',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              style: TextStyle(fontSize: 16.sp),
                              onChanged: (query) {
                                _productCubit.searchProducts(query);
                              },
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                _productCubit.clearSearch();
                              },
                              child: Icon(Icons.clear, size: 20.sp, color: Colors.grey),
                            ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: _toggleSearch,
                            child: Text(
                              AppLocalizations.of(context).cancel,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.cxBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context).products, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500)),
                        IconButton(
                          icon: Iconify(Tabler.filter, size: 27.sp, color: AppColors.cxDADADA),
                          onPressed: () {
                            // TODO: Implement filter functionality
                          },
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 20.h),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                // Show skeleton for initial load (no categories)
                if (state is ProductLoading && state.categories == null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => ProductCardSkeleton(),
                    ),
                  );
                }

                if (state is ProductLoaded && state.products.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            state.searchQuery != null ? Icons.search_off : Icons.inventory_2_outlined,
                            size: 64.sp,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            state.searchQuery != null 
                                ? 'Hech narsa topilmadi' 
                                : 'Maxsulotlar yo\'q',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          if (state.searchQuery != null) ...[
                            SizedBox(height: 8.h),
                            Text(
                              'Boshqa so\'z bilan qidiring',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }

                // Show flat list when searching
                if (state is ProductLoaded && state.searchQuery != null) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: Text(
                            '${state.products.length} ta natija topildi',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.cx6B7280,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              final product = state.products[index];
                              return _buildProductCard(context, product);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (state is ProductLoaded && state.groupedProducts != null) {
                  // Display products grouped by category
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, categoryIndex) {
                        final category = state.categories[categoryIndex];
                        final categoryProducts = state.groupedProducts![category.id] ?? [];
                        
                        // Skip empty categories
                        if (categoryProducts.isEmpty) {
                          return SizedBox.shrink();
                        }
                        
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category header
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h, top: categoryIndex == 0 ? 0 : 20.h),
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cxBlack,
                                ),
                              ),
                            ),
                            // Products in this category
                            ...categoryProducts.map((product) {
                              return _buildProductCard(context, product);
                            }).toList(),
                          ],
                        );
                      },
                    ),
                  );
                }
                
                // Handle loading state with categories (switching tabs)
                if (state is ProductLoading && state.categories != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => ProductCardSkeleton(),
                    ),
                  );
                }

                return Expanded(
                  child: Center(
                    child: Text('Something went wrong'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      ),
    );
  }
}
