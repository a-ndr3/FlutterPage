import 'package:flutter/material.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'buttons.dart';
import 'functions.dart';

class AboutPage extends StatelessWidget {
  final supportMethods = SupportMethods();

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
              supportMethods.pageNameContainer("ABOUT"),
              const SizedBox(height: 60.0),
              Text(
                ' I am doing my master\'s in Software Engineering at the Johannes Kepler Universität Linz.\n Also, I work part-time at the Institute of Software Systems Engineering where I work \n with research software. In my spare time I check things in .NET, Dart and Java.',
                strutStyle: StrutStyle(
                  height: 1,
                ),
                textAlign: TextAlign.left,
                maxLines: 8,
                style: AppTextStyles.aboutPageMainText,
              ),
              const SizedBox(height: 60.0),
              HoverableElevatedButton(
                onPressed: () {
                  supportMethods.openUrl(
                      "https://lh3.googleusercontent.com/d/1BO9U3BiBydBUV5O1yWRWovtwEfNIDruv");
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('VIEW CV', style: AppTextStyles.buttonText),
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
              const SizedBox(height: 310.0),
              supportMethods.midButtons(context, 'PROJECTS', 'NEWS'),
            ],
          ),
          supportMethods.linksContainer(),
        ],
      ),
    );
  }
}
