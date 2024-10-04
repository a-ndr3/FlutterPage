import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_spa_v3/AppColors.dart';
import 'package:project_spa_v3/buttons.dart';
import 'package:project_spa_v3/functions.dart';
import 'carouselitem.dart';
import 'AppTextStyles.dart';

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
      return const Center(
          child: Text('Error fetching carousel items',
              style: AppTextStyles.sidePanelText));
    }

    final List<CarouselItem>? carouselItems =
        CarouselItem.categorizedItems[widget.tag];

    if (carouselItems == null || carouselItems.isEmpty) {
      return const Center(
          child: Text('No carousel items available',
              style: AppTextStyles.sidePanelText));
    }

    return Center(
      child: Container(
        width: 800,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CarouselSlider(
          items: buildCarouselItems(carouselItems, context),
          options: CarouselOptions(
            height: 300,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            viewportFraction: 0.33,
          ),
        ),
      ),
    );
  }

  List<Widget> buildCarouselItems(
      List<CarouselItem> items, BuildContext context) {
    return items.map((item) {
      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 80),
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
                      padding: const EdgeInsets.only(
                          top: 50.0, left: 20, right: 20, bottom: 50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            item.title.toUpperCase(),
                            style: AppTextStyles.aboutPageContainer,
                          ),
                          const SizedBox(height: 20),
                          HoverableElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              supportMethods.openUrl(item.url);
                            },
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Open link',
                                        style: AppTextStyles.buttonText),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_outward,
                                        size: 18,
                                        color: Colors.white,
                                        weight: 5,
                                        fill: 1.0,
                                        grade: 1.0),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            item.description,
                            style: AppTextStyles.additionalTextPureWhite,
                          ),
                        ],
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
            margin: const EdgeInsets.symmetric(horizontal: 6.0),
            width: 800,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(item.imageUrl,
                    width: 220, height: 180, fit: BoxFit.contain),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
