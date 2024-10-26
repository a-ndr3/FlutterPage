import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'buttons.dart';
import 'functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutPage extends StatelessWidget {
  final supportMethods = SupportMethods();

  @override
  Widget build(BuildContext context) {
    final screentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          supportMethods.logoContainer(context),
          Column(
            children: [
              supportMethods.pageNameContainer("ABOUT", context),
              SizedBox(height: 60.h),
              FutureBuilder<String>(
                future: supportMethods.fetchTxtFile('about'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return new Container(
                        width: 600.w,
                        child: Text(snapshot.data!,
                            strutStyle: StrutStyle(
                              height: 1.h,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 8,
                            style: supportMethods.getTextStyleWithDimensions(
                                context,
                                AppTextStyles.aboutPageMainText,
                                supportMethods.isMobileWidth(context)
                                    ? 30.sp
                                    : 14.sp,
                                15.sp)));
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
                      "https://drive.google.com/file/d/1Kr9aYNoCftvkMAjldJHpx-HvZAMlBXFr/view");
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('VIEW CV',
                        style: supportMethods.getTextStyleWithDimensions(
                            context,
                            AppTextStyles.buttonText,
                            supportMethods.isMobileWidth(context)
                                ? 28.sp
                                : 6.sp,
                            8.sp)),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_outward,
                        size: supportMethods.isMobile(context) ? 10 : 18,
                        color: Colors.white,
                        weight: 5,
                        fill: 1.0,
                        grade: 1.0),
                  ],
                ),
              ),
              SizedBox(
                  height: supportMethods.isMobileWidth(context)
                      ? 180.h
                      : supportMethods.isMobile(context)
                          ? 80.h
                          : 180.h),
              supportMethods.midButtons(context, 'PROJECTS', 'NEWS'),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
