import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isGrey;
  final bool heartIcon;
  final bool isFavourite;

  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.isGrey = false,
    required this.heartIcon,
    this.isFavourite = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (heartIcon) {
      return Container(
        width: 37.w,
        height: 37.h,
        decoration: BoxDecoration(
          color: MyColors.darkerGrey,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            Icons.favorite,
            color: isFavourite ? MyColors.red : MyColors.white,
            size: 23.sp,
          ),
          onPressed: onPressed,
          padding: EdgeInsets.zero,
        ),
      );
    }

    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isGrey
            ? MyColors.darkGrey
            : (isDark ? MyColors.darkGrey : MyColors.white),
        border: Border.all(
          color: isDark ? MyColors.darkerGrey : MyColors.lighterGrey,
          width: 1,
        ),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20.sp),
        color: isDark ? MyColors.black : MyColors.mainColor,
        onPressed: onPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
