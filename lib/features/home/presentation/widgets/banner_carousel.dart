import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:e_commerce_app/core/widges/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/font_weight_helper.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>>  banners = [
    {
    "colors": [MyColors.mainColor, MyColors.white],
    "title": "new_arrivals".tr(),
    "subtitle": "discover_trends".tr(),
    "buttonText": "explore".tr(),
    },
    {
    "colors": [MyColors.lightGrey, MyColors.mainColor],
    "title": "fifty_off".tr(),
    "subtitle": "limited_time".tr(),
    "buttonText": "shop_now".tr(),
    },
    {
    "colors": [MyColors.secondColor, MyColors.lightGrey],
    "title": "flash_sale".tr(),
    "subtitle": "hurry_up".tr(),
    "buttonText": "grab_deal".tr(),
    },
    ];


    return CarouselSlider(
      options: CarouselOptions(
        height: 160.h,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      items: banners.map((banner) {
        final List<Color> gradientColors = banner["colors"] as List<Color>;
        final String title = banner["title"] as String;
        final String subtitle = banner["subtitle"] as String;
        final String buttonText = banner["buttonText"] as String;

        return Builder(
          builder: (context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(colors: gradientColors, begin: Alignment.topLeft, end: Alignment.bottomRight,),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title, style: TextStyles.font18WhiteBold),
                          SizedBox(height: 6.h),
                          Text(
                            subtitle,
                            style: TextStyles.font18WhiteBold.copyWith(fontWeight: FontWeightHelper.regular, fontSize: 14.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(width: 120.w,
                            child:ButtonWidget(
                              radius: 12.r,
                              buttonColor: Colors.white,
                              textColor: MyColors.mainColor,
                              width: 200.w,
                              onPressed: () {},
                              text: buttonText,
                              isUpperCase: false,
                              height: 38.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}