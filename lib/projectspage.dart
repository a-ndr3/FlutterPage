import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'functions.dart';
import 'carouselviews.dart';

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
          const Padding(
            padding: EdgeInsets.only(left: 30.0, top: 20, right: 0, bottom: 5),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('ANDRE', style: AppTextStyles.logoTextStyle)),
          ),
          Column(
            children: [
              supportMethods.pageNameContainer("PROJECTS"),
              const SizedBox(height: 60.0),
              CarouselViews(tag: 'projects'),
              const SizedBox(height: 200.0),
              supportMethods.midButtons(context, 'ABOUT', 'NEWS'),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
