import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'functions.dart';
import 'carouselviews.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsPage extends StatelessWidget {
  final supportMethods = SupportMethods();

  NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          supportMethods.logoContainer(context),
          Column(
            children: [
              supportMethods.pageNameContainer("NEWS", context),
              SizedBox(height: 60.h),
              CarouselViews(tag: 'news'),
              SizedBox(height: 100.h),
              supportMethods.midButtons(context, 'ABOUT', 'PROJECTS'),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
