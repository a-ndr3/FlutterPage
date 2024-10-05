import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'functions.dart';
import 'carouselviews.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectsPage extends StatelessWidget {
  final supportMethods = SupportMethods();

  ProjectsPage({super.key});

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
              supportMethods.pageNameContainer("PROJECTS", context),
              SizedBox(height: 60.h),
              CarouselViews(tag: 'projects'),
              SizedBox(height: 100.h),
              supportMethods.midButtons(context, 'ABOUT', 'NEWS'),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
