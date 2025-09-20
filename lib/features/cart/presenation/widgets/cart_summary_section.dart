import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/core/widges/button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/locale_keys.g.dart';

class CartSummarySection extends StatelessWidget {
  final double total;
  final int itemsCount;
  final VoidCallback onCheckout;

  const CartSummarySection({
    super.key,
    required this.total,
    required this.itemsCount,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(LocaleKeys.shipping_information.tr(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          verticalSpace(10.h),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:  isDarkMode ? MyColors.darkGrey : MyColors.lighterGrey,
              border: isDarkMode? Border.all(color: MyColors.darkGrey): Border.all(color: MyColors.lighterGrey),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children:  [
                Icon(Icons.credit_card, color: MyColors.red),
                horizontalSpace(10.w),
                Text("**** **** **** 5124"),
                Spacer(),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          verticalSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${LocaleKeys.total.tr()} ($itemsCount ${LocaleKeys.items.tr()})"),
              Text("\$${total.toStringAsFixed(2)}"),
            ],
          ),
          verticalSpace(5.h),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(LocaleKeys.shipping_fee.tr()), Text("\$0.00")],
          ),
          verticalSpace(5.h),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(LocaleKeys.taxes.tr()), Text("\$0.00")],
          ),
          Divider(color: MyColors.lighterGrey, thickness: 1),
          verticalSpace(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    LocaleKeys.total.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "\$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              ButtonWidget(width: 180.w, onPressed: (){}, text: LocaleKeys.checkout.tr(),isUpperCase: false,),
            ],
          ),
        ],
      ),
    );
  }
}
