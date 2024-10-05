import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'buttons.dart';
import 'functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterPage extends StatelessWidget {
  final supportMethods = SupportMethods();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile =
        screenWidth < 600 || (screenWidth < 950 && screenHeight < 500);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          supportMethods.logoContainer(context),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.yellow,
                      Colors.tealAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FutureBuilder<NetworkImage>(
                    future: supportMethods.fetchEnterImage(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return CircleAvatar(
                          backgroundImage: snapshot.data,
                          radius: isMobile ? 120.r : 90.r,
                        );
                      } else {
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: isMobile ? 120.r : 90.r,
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'ANDREI BLOKHIN',
                style: supportMethods.getTextStyleWithDimensions(
                    context, AppTextStyles.enterPageHeadline, 24.sp, 48),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'TECHNICIAN / ASSOCIATE SOFTWARE ENGINEER',
                style: supportMethods.getTextStyleWithDimensions(
                    context, AppTextStyles.enterPageDescription, 16.sp, 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              HoverableElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('ENTER',
                        style: supportMethods.getTextStyleWithDimensions(
                            context, AppTextStyles.buttonText, 14.sp, 18)),
                  ],
                ),
              ),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
