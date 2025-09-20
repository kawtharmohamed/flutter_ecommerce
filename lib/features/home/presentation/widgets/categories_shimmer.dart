import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/theming/colors.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: MyColors.lightGrey,
            highlightColor: MyColors.lighterGrey,
            child: Container(
              width: 90.w,
              height: 90.w,
              decoration: const BoxDecoration(
                color: MyColors.white,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }
}
