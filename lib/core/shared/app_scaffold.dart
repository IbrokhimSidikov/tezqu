import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child, this.appBar});
  final Widget child;
  final PreferredSizeWidget? appBar;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child:ColoredBox(
            color:AppColors.cx43C19F,
          child: Stack(

          ),
        ),
      ),
    );
  }
}
