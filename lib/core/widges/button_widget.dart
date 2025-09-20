import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double? height;
  final double radius;
  final Color? buttonColor;
  final Color? textColor;
  final bool isUpperCase;
  final double fontSize;
  final VoidCallback onPressed;
  final String text;

  const ButtonWidget({
    super.key,
    required this.width,
    required this.onPressed,
    required this.text,
    this.height,
    this.radius = 25.0,
    this.buttonColor,
    this.textColor,
    this.isUpperCase = true,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width.w,
      height: height?.h ?? 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        color: buttonColor ??
            (isDark ? MyColors.darkGrey : MyColors.mainColor),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor ?? (isDark ? MyColors.black : Colors.white),
            fontSize: fontSize.sp,
          ),
        ),
      ),
    );
  }
}
