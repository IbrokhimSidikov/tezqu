import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';

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
          child: SvgPicture.asset('assets/icons/logoOnboard.svg',
              height: 58, width: 91, fit: BoxFit.contain),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/icons/infoIcon.svg',
                height: 53, width: 53),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF43C19F),
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.push(AppRoutes.home);
          },
          child: Text('Home'),
        ),
      ),
    );
  }
}
