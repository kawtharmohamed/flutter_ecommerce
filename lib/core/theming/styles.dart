import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

class TextStyles{
  static TextStyle font20BlackSemiBold= TextStyle(
    color: MyColors.black,
    fontSize:20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font20WhiteSemiBold= TextStyle(
    color: MyColors.white,
    fontSize:20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font18WhiteBold= TextStyle(
    color: MyColors.white,
    fontSize:18.sp,
    fontWeight: FontWeightHelper.bold,
  );


  static TextStyle font14BlackMedium= TextStyle(
    color: MyColors.black,
    fontSize:14.sp,
    fontWeight: FontWeightHelper.medium,
  );
 static TextStyle font20NavyBold = TextStyle(
   color: MyColors.mainColor,
   fontSize:20.sp,
   fontWeight: FontWeightHelper.bold,
 );

  static TextStyle font14Grey = TextStyle(
    color: MyColors.grey,
    fontSize:14.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14White= TextStyle(
    color: MyColors.white,
    fontSize:14.sp,
    fontWeight: FontWeightHelper.medium,
  );


}