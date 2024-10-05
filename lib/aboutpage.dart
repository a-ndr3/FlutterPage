import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'buttons.dart';
import 'functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  final supportMethods = SupportMethods();

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
            child: const Align(
                alignment: Alignment.topLeft,
                child: Text('ANDRE', style: AppTextStyles.logoTextStyle)),
          ),
          Column(
            children: [
              supportMethods.pageNameContainer("ABOUT"),
              SizedBox(height: 60.h),
              FutureBuilder<String>(
                future: supportMethods.fetchTxtFile('about'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return new Container(
                        width: 600.w,
                        child: Text(
                          snapshot.data!,
                          strutStyle: StrutStyle(
                            height: 1.h,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 8,
                          style: AppTextStyles.aboutPageMainText.copyWith(
                            fontSize: 12.sp,
                          ),
                        ));
                  } else {
                    return new Container(
                        width: 600.w,
                        child: const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        )));
                  }
                },
              ),
              SizedBox(height: 60.h),
              HoverableElevatedButton(
                onPressed: () {
                  supportMethods.openUrl(
                      "https://lh3.googleusercontent.com/d/1BO9U3BiBydBUV5O1yWRWovtwEfNIDruv");
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('VIEW CV',
                        style:
                            AppTextStyles.buttonText.copyWith(fontSize: 10.sp)),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_outward,
                        size: 18,
                        color: Colors.white,
                        weight: 5,
                        fill: 1.0,
                        grade: 1.0),
                  ],
                ),
              ),
              SizedBox(height: 200.h),
              supportMethods.midButtons(context, 'PROJECTS', 'NEWS'),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
