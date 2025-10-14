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
import '../../../../core/shared/app_banner.dart';
import '../../data/models/product_model.dart';
import '../cubit/product_cubit.dart';
import '../cubit/product_state.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // Load initial products will be done in build method with BlocProvider
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'sold':
        return 'Sotildi';
      case 'active':
      default:
        return 'Active';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..initialize(),
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
        title: Text('Maxsulotlar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
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
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
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
            AppBanner(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Toifalar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
                IconButton(
                  icon: Iconify(Tabler.filter, size: 27.sp, color: AppColors.cxDADADA),
                  onPressed: () {
                    // TODO: Implement filter functionality
                  },
                ),
              ],
            ),
            SizedBox(height: 10.h),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                final categories = state is ProductLoaded 
                    ? state.categories 
                    : state is ProductError && state.categories != null
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
                              context.read<ProductCubit>().loadProductsByCategory(categories[index].id);
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
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is ProductLoaded && state.products.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text('No products found'),
                    ),
                  );
                }

                if (state is ProductLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                color: AppColors.cxF5F7F9,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: product.imageUrl != null && product.imageUrl!.isNotEmpty
                                    ? Image.network(
                                        product.imageUrl!,
                                        width: 60.w,
                                        height: 60.h,
                                        fit: BoxFit.contain,
                                        errorBuilder: (context, error, stackTrace) => Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 40.sp,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 40.sp,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${product.name} ${product.year}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: product.status.toLowerCase() == 'active'
                                              ? Color(0xFFE8F5E9)
                                              : Color(0xFFFFEBEE),
                                          borderRadius: BorderRadius.circular(12.r),
                                        ),
                                        child: Text(
                                          _getStatusText(product.status),
                                          style: TextStyle(
                                            color: product.status.toLowerCase() == 'active'
                                                ? Color(0xFF2E7D32)
                                                : Color(0xFFC62828),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    product.details,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.cx6B7280,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    '\$${product.price}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.cxWhite,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                      },
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
