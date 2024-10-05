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
          Padding(
            padding:
                EdgeInsets.only(left: 30.w, top: 20.h, right: 0, bottom: 5.h),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('ANDRE', style: AppTextStyles.logoTextStyle)),
          ),
          Column(
            children: [
              supportMethods.pageNameContainer("NEWS"),
              const SizedBox(height: 60.0),
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
