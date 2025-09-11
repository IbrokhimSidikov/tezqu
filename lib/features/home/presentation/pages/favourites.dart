import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  final List<FavoriteItem> favoriteItems = [
    FavoriteItem(
      id: '1',
      title: 'Mercedes-Benz',
      subtitle: 'E class 2025',
      price: '\$76 000',
      status: 'Active',
      statusColor: AppColors.cx43C19F,
      imageUrl: 'assets/images/car.svg',
    ),
    FavoriteItem(
      id: '2',
      title: 'Nissan',
      subtitle: 'Patrol 2024',
      price: '\$136 000',
      status: 'Sotildi',
      statusColor: Colors.red,
      imageUrl: 'assets/images/car.svg',
    ),
    FavoriteItem(
      id: '3',
      title: 'iPhone 16 pro max',
      subtitle: '512 gb',
      price: '\$1 000',
      status: 'Active',
      statusColor: AppColors.cx43C19F,
      imageUrl: 'assets/images/car.svg',
    ),
    FavoriteItem(
      id: '4',
      title: 'Macbook Air',
      subtitle: 'M4 256',
      price: '\$1 200',
      status: 'Active',
      statusColor: AppColors.cx43C19F,
      imageUrl: 'assets/images/car.svg',
    ),
  ];

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
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text('Sevimlilar', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.cxF5F7F9,
              ),
              child: IconButton(
                iconSize: 29.sp,
                icon: Icon(Icons.search),
                color: AppColors.cxBlack,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w, right: 20.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 22.h,
            childAspectRatio: 0.75,
          ),
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            return _buildFavoriteCard(favoriteItems[index]);
          },
        ),
      )
    );
  }

  Widget _buildFavoriteCard(FavoriteItem item) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cxWhite,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with heart icon
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cxF5F7F9,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.directions_car,
                      size: 60.sp,
                      color: AppColors.cxAFB1B1,
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: AppColors.cxWhite,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.cx43C19F,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Content section
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.cxBlack,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.subtitle,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cxBlack,
                        ),
                        maxLines: 1 ,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  
                  // Price and status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.price,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.cx43C19F,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: item.statusColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          item.status,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.cxWhite,
                          ),
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
    );
  }
}

class FavoriteItem {
  final String id;
  final String title;
  final String subtitle;
  final String price;
  final String status;
  final Color statusColor;
  final String imageUrl;

  FavoriteItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.status,
    required this.statusColor,
    required this.imageUrl,
  });
}
