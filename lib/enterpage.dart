import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'buttons.dart';
import 'functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterPage extends StatelessWidget {
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
                          radius: 80.r,
                        );
                      } else {
                        return CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 80.r,
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'ANDREI BLOKHIN',
                style:
                    AppTextStyles.enterPageHeadline.copyWith(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'TECHNICIAN / ASSOCIATE SOFTWARE ENGINEER',
                style: AppTextStyles.enterPageDescription
                    .copyWith(fontSize: 12.sp),
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
                        style:
                            AppTextStyles.buttonText.copyWith(fontSize: 10.sp)),
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
