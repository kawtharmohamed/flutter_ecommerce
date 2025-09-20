import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar snackBarWidget({
  required String text,
  Duration duration = const Duration(seconds: 4),
}) => SnackBar(
  backgroundColor: MyColors.mainColor,
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.all(12.w),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
  content: Text(
    text,
    style: const TextStyle(
      color: MyColors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      letterSpacing: 1.0,
    ),
    textAlign: TextAlign.center,
  ),
);
