import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/tabler.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/skeleton_loader.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../products/data/models/product_model.dart';
import '../../../products/presentation/pages/details.dart';
import '../cubit/warehouse_cubit.dart';
import '../cubit/warehouse_state.dart';

class Warehouse extends StatefulWidget {
  const Warehouse({super.key});

  @override
  State<Warehouse> createState() => _WarehouseState();
}

class _WarehouseState extends State<Warehouse> {
  int selectedTabIndex = 0;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late final WarehouseCubit _warehouseCubit;

  @override
  void initState() {
    super.initState();
    _warehouseCubit = getIt<WarehouseCubit>()..initialize();
    _searchController.addListener(() {
      setState(() {}); // Rebuild to show/hide clear button
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _warehouseCubit.close();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _warehouseCubit.clearSearch();
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _warehouseCubit,
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
          title: Text('Omborxona', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Hero(
                tag: 'add_product_button',
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.cxF5F7F9,
                    ),
                    child: IconButton(
                      iconSize: 29.sp,
                      icon: Icon(Icons.add),
                      color: AppColors.cx43C19F,
                      onPressed: () {
                        context.push(AppRoutes.addProduct);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 20.w),
          child: Column(
            children: [
              // Error message
              BlocBuilder<WarehouseCubit, WarehouseState>(
                builder: (context, state) {
                  if (state is WarehouseError) {
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
              // Search bar with animation
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
                                  hintText: AppLocalizations.of(context).searching,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                style: TextStyle(fontSize: 16.sp),
                                onChanged: (query) {
                                  print('🔎 TextField onChanged called with: "$query"');
                                  _warehouseCubit.searchProducts(query);
                                },
                              ),
                            ),
                            if (_searchController.text.isNotEmpty)
                              GestureDetector(
                                onTap: () {
                                  _searchController.clear();
                                  _warehouseCubit.clearSearch();
                                },
                                child: Icon(Icons.clear, size: 20.sp, color: Colors.grey),
                              ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: _toggleSearch,
                              child: Text(
                                AppLocalizations.of(context).cancelSearch,
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
                          Text(AppLocalizations.of(context).categories, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500)),
                          GestureDetector(
                            onTap: _toggleSearch,
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              child: Iconify(Tabler.search, size: 27.sp, color: AppColors.cxDADADA),
                            ),
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 18.h),
              // Category tabs or search results indicator
              BlocBuilder<WarehouseCubit, WarehouseState>(
                builder: (context, state) {
                  // Show search results count when searching
                  if (_isSearching && state is WarehouseLoaded && state.searchQuery != null) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Text(
                        '${state.products.length} ${AppLocalizations.of(context).resultsFound}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.cx6B7280,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  
                  // Hide category tabs when searching
                  if (_isSearching) {
                    return SizedBox.shrink();
                  }
                  
                  final categories = state is WarehouseLoaded 
                      ? state.categories 
                      : state is WarehouseLoading && state.categories != null
                          ? state.categories!
                      : state is WarehouseError && state.categories != null
                          ? state.categories!
                          : [];
                  
                  if (categories.isEmpty) {
                    return SizedBox.shrink();
                  }
                  
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(categories.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: CupertinoButton(
                            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                            borderRadius: BorderRadius.circular(30.r),
                            color: selectedTabIndex == index ? AppColors.cxBlack : AppColors.cxF5F7F9,
                            child: Text(
                              categories[index].name,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: selectedTabIndex == index ? Colors.white : AppColors.cxBlack,
                              ),
                            ),
                            onPressed: () {
                              if (selectedTabIndex != index) {
                                setState(() {
                                  selectedTabIndex = index;
                                });
                                // Load products for the selected category
                                _warehouseCubit.loadProductsByCategory(categories[index].id);
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              // Products list
              BlocBuilder<WarehouseCubit, WarehouseState>(
                builder: (context, state) {
                  // Show skeleton for initial load (no categories)
                  if (state is WarehouseLoading && state.categories == null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => ProductCardSkeleton(),
                      ),
                    );
                  }

                  if (state is WarehouseLoaded && state.products.isEmpty) {
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

                  if (state is WarehouseLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final product = state.products[index];
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
                        },
                      ),
                    );
                  }
                  
                  // Handle loading state with categories (switching tabs)
                  if (state is WarehouseLoading && state.categories != null) {
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

class ModalContainer extends StatelessWidget {
  const ModalContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
