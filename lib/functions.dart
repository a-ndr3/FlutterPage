import 'dart:convert';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_spa_v3/AppColors.dart';
import 'package:project_spa_v3/AppTextStyles.dart';
import 'package:project_spa_v3/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'buttons.dart';
import 'carouselitem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportMethods {
  void openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Container midButtons(context, String btn1, String btn2) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HoverableElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              'HOME',
              style: AppTextStyles.buttonText.copyWith(fontSize: 10.sp),
            ),
          ),
          const SizedBox(width: 10),
          HoverableElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/${btn1.toLowerCase()}');
            },
            child: Text(
              btn1,
              style: AppTextStyles.buttonText.copyWith(fontSize: 10.sp),
            ),
          ),
          const SizedBox(width: 10),
          HoverableElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/${btn2.toLowerCase()}');
            },
            child: Text(
              btn2,
              style: AppTextStyles.buttonText.copyWith(fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }

  Container linksContainer() {
    return Container(
      padding:
          EdgeInsets.only(top: 50.h, bottom: 50.h, left: 50.w, right: 50.w),
      margin: EdgeInsets.symmetric(vertical: 20.h).copyWith(right: 20.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 20.w),
            HoverIconButton(
                icon: Icon(FontAwesomeIcons.github),
                color: Color.fromRGBO(255, 255, 255, 0.8),
                onPressed: () {
                  openUrl('https://github.com/a-ndr3');
                }),
            SizedBox(width: 20.w),
            HoverIconButton(
              icon: Icon(FontAwesomeIcons.linkedin),
              color: Color.fromRGBO(255, 255, 255, 0.8),
              onPressed: () {
                openUrl('https://www.linkedin.com/in/andreiblokhin/');
              },
            ),
            SizedBox(width: 20.w),
            HoverIconButton(
              icon: Icon(FontAwesomeIcons.telegram),
              color: Color.fromRGBO(255, 255, 255, 0.8),
              onPressed: () {
                openUrl('https://t.me/andr_1110');
              },
            ),
            SizedBox(width: 20.w),
            HoverIconButton(
              icon: Icon(FontAwesomeIcons.orcid),
              color: Color.fromRGBO(255, 255, 255, 0.8),
              onPressed: () {
                openUrl('https://orcid.org/0009-0006-5185-2635');
              },
            ),
            SizedBox(width: 20.w),
            HoverIconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              color: Color.fromRGBO(255, 255, 255, 0.8),
              onPressed: () {
                openUrl('https://instagram.com/a_blohin');
              },
            ),
            SizedBox(width: 20.w),
            HoverIconButton(
                icon: Icon(FontAwesomeIcons.envelope),
                color: Color.fromRGBO(255, 255, 255, 0.8),
                onPressed: () {
                  openUrl('mailto:andrei_blokhin@outlook.com');
                }),
          ],
        ),
      ),
    );
  }

  Column pageNameContainer(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 120),
          child: Text(
            name,
            style: AppTextStyles.aboutPageContainer,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          height: 1.0,
          width: 620,
          color: AppColors.primaryColorSidePanelText,
        ),
      ],
    );
  }

  List<Widget> buildCarouselItems(int itemCount) {
    return List.generate(itemCount, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        width: 250,
        height: 170,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(),
      );
    });
  }

  Future<NetworkImage> fetchEnterImage() async {
    final ref = MainApp.storage.ref().child('enter_page');
    final ListResult result = await ref.listAll();
    final url = await result.items.first.getDownloadURL();

    return NetworkImage(url);
  }

  Future<String> fetchTxtFile(String fileName) async {
    final ref = MainApp.storage.ref().child(fileName);
    final ListResult result = await ref.listAll();
    final data = await result.items.first.getData();

    return utf8.decode(data!);
  }

  Future<void> fetchAndCategorizeCarouselItems() async {
    try {
      final ref = MainApp.storage.ref().child('carousel_images');
      final ListResult result = await ref.listAll();
      Map<String, String> imageUrls = {};

      for (var item in result.items) {
        final String url = await item.getDownloadURL();
        final String imageName = item.name;
        imageUrls[imageName] = url;
      }

      final refJson = MainApp.storage.ref().child('json_folder');
      final ListResult resultJson = await refJson.listAll();

      final jsonData = await resultJson.items.first.getData();
      final List<dynamic> jsonItems = jsonDecode(utf8.decode(jsonData!));

      List<CarouselItem> carouselItems = [];

      for (var jsonItem in jsonItems) {
        final Map<String, dynamic> itemData = jsonItem;
        final String imageUrlFromJson = itemData['imageName'];

        if (imageUrls.containsKey(imageUrlFromJson)) {
          carouselItems.add(CarouselItem(
            tag: itemData['tag'],
            title: itemData['title'],
            imageUrl: imageUrls[imageUrlFromJson]!,
            description: itemData['description'],
            url: itemData['url'],
          ));
        }
      }
      CarouselItem.categorizeItems(carouselItems);
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
