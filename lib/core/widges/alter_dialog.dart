import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../localization/locale_keys.g.dart';

Widget chooseLanguageDialog({
  required VoidCallback onPressed1,
  required VoidCallback onPressed2,
}) =>
    AlertDialog(
      title: Text(LocaleKeys.Choose.tr()),
      actions: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: onPressed1,
                    child: Text(LocaleKeys.English.tr()),
                  ),
                  horizontalSpace(2.w),
                  ElevatedButton(
                    onPressed: onPressed2,
                    child: Text(LocaleKeys.Arabic.tr()),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
