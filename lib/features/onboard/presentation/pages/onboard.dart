import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/shared/button_widget.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 107,
        leading: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(AppImages.logoOnboard,
              height: 58, width: 91, fit: BoxFit.contain),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(AppImages.infoIcon,
                height: 53, width: 53),
          ),
        ],
      ),
      backgroundColor: AppColors.cx43C19F,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
           // spacing: 20,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppImages.moshina2,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ButtonWidget(
                      text: 'Davom ettirish',
                      onPressed: () {
                        context.push(AppRoutes.login);
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'OMMAVIY OFFERTA',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 22,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Qulay to‘lov va',textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),),
                Text('tezkor xarid', textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold), ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
