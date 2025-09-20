import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../domain/entity/product_entity.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.product_details.tr(),
          style: isDarkMode ? TextStyles.font20WhiteSemiBold : TextStyles.font20BlackSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 330.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(product.image), fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 220.h),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50.r), topLeft: Radius.circular(50.0.r),
                      ),
                      color: isDarkMode ? MyColors.black : MyColors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title, style: isDarkMode ? TextStyles.font20WhiteSemiBold.copyWith(fontSize: 18) : TextStyles.font20BlackSemiBold.copyWith(fontSize: 18),),
                          verticalSpace(10.h),
                          Row(
                            children: [
                              Icon(
                                Icons.category,
                                color: isDarkMode ? MyColors.white : MyColors.black, size: 20.sp,
                              ),
                              horizontalSpace(10.w),
                              Text(product.category, style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,),
                            ],
                          ),
                          verticalSpace(15.h),
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: isDarkMode ? TextStyles.font20WhiteSemiBold : TextStyles.font20BlackSemiBold,
                          ),
                          verticalSpace(15.h),
                          Row(
                            children: [
                              Icon(Icons.star, size: 20.sp, color: MyColors.darkYellow,),
                              horizontalSpace(4.w),
                              Text("${product.rating.rate} (${product.rating.count})",
                                style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
