import 'package:e_commerce_app/core/localization/locale_keys.g.dart';
import 'package:e_commerce_app/core/widges/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widges/circular_icon_button.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isEnglish = context.locale.languageCode == "en";

    return Container(
      height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: isDarkMode ? MyColors.darkGrey : MyColors.lighterGrey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          CircularIconButton(icon: Icons.location_on, onPressed: () {} , isGrey: true, heartIcon: false,),
           SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( LocaleKeys.send_to.tr(),
                style: isDarkMode ? TextStyles.font14White : TextStyles.font14Grey,
              ),
               Text(LocaleKeys.your_location.tr(),
                style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,
                ),
            ],
          ),
           Padding(
             padding: isEnglish? EdgeInsets.only(left: 85.w) : EdgeInsets.only(right: 85.w),
             child: ButtonWidget(width: 110.w, onPressed: (){}, text: LocaleKeys.change.tr(),isUpperCase: false,),
           )
        ],
      ),
    );
  }
}