import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_spa_v3/AppColors.dart';
import 'package:project_spa_v3/buttons.dart';
import 'package:project_spa_v3/functions.dart';
import 'carouselitem.dart';
import 'AppTextStyles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselViews extends StatefulWidget {
  final String tag;

  const CarouselViews({Key? key, required this.tag}) : super(key: key);

  @override
  _CarouselViewsState createState() => _CarouselViewsState();
}

class _CarouselViewsState extends State<CarouselViews> {
  bool isLoading = true;
  bool hasError = false;

  final SupportMethods supportMethods = SupportMethods();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      if (CarouselItem.categorizedItems.isEmpty) {
        await supportMethods.fetchAndCategorizeCarouselItems();
      }
      setState(() {
        isLoading = false;
        hasError = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColorText,
      ));
    }
    if (hasError) {
      return Center(
          child: Text('Error fetching carousel items',
              style: AppTextStyles.sidePanelText.copyWith(fontSize: 12.sp)));
    }

    final List<CarouselItem>? carouselItems =
        CarouselItem.categorizedItems[widget.tag];

    if (carouselItems == null || carouselItems.isEmpty) {
      return Center(
          child: Text('No carousel items available',
              style: AppTextStyles.sidePanelText.copyWith(fontSize: 12.sp)));
    }

    return Center(
      child: Container(
        width: 600.w,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: CarouselSlider(
          items: buildCarouselItems(carouselItems, context),
          options: CarouselOptions(
            height: supportMethods.isMobile(context) ? 350.h : 300.h,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            viewportFraction: 0.33,
          ),
        ),
      ),
    );
  }

  List<Widget> buildCarouselItems(
      List<CarouselItem> items, BuildContext context) {
    return items.map((item) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SafeArea(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 80.h),
                      child: Dialog(
                        backgroundColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 50.h, left: 20.w, right: 20.w, bottom: 50.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 40.h),
                              Text(
                                item.title.toUpperCase(),
                                style:
                                    supportMethods.getTextStyleWithDimensions(
                                        context,
                                        AppTextStyles.openDialogHeading,
                                        supportMethods.isMobileWidth(context)
                                            ? 40.sp
                                            : 12.sp,
                                        18.sp),
                              ),
                              SizedBox(height: 20.h),
                              HoverableElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  supportMethods.openUrl(item.url);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('OPEN LINK',
                                            style: supportMethods
                                                .getTextStyleWithDimensions(
                                                    context,
                                                    AppTextStyles.buttonText,
                                                    supportMethods
                                                            .isMobileWidth(
                                                                context)
                                                        ? 22.sp
                                                        : 6.sp,
                                                    10.sp)),
                                        SizedBox(width: 10),
                                        Icon(Icons.arrow_outward,
                                            size:
                                                supportMethods.isMobile(context)
                                                    ? 10
                                                    : 18,
                                            color: Colors.white,
                                            weight: 5,
                                            fill: 1.0,
                                            grade: 1.0),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                item.description,
                                style:
                                    supportMethods.getTextStyleWithDimensions(
                                        context,
                                        AppTextStyles.openDialogDescription,
                                        supportMethods.getCorrectSize(
                                            context, 32.sp, 18.sp, 12.sp),
                                        14.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              width: 600.w,
              height: 220.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(item.imageUrl,
                      width: 220.w, height: 180.h, fit: BoxFit.contain),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
