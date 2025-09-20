import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/widges/snackbar_widget.dart';
import '../cubit/ecommerce_cubit.dart';
import '../cubit/ecommerce_state.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.categories.tr(),
            style:  isDarkMode ? TextStyles.font20WhiteSemiBold.copyWith(fontWeight: FontWeightHelper.medium) : TextStyles.font20BlackSemiBold.copyWith(fontWeight: FontWeightHelper.medium),
          ),
          SizedBox(height: 8.h),
          BlocConsumer<EcommerceCubit, EcommerceState>(
            listener: (context, state) {
              if (state is EcommerceErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBarWidget(text: state.message),
                );
              }
            },
            builder: (context, state) {
              if (state is EcommerceLoading) {
                return CategoriesShimmer();
              } else if (state is EcommerceLoaded && state.categories.isNotEmpty) {
                return SizedBox(
                  height: 90.w,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          color:  isDarkMode ? MyColors.darkGrey : MyColors.moreLightGrey,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            state.categories[index],
                            textAlign: TextAlign.center,
                            style: TextStyles.font14BlackMedium,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is EcommerceErrorState) {
                return Text(state.message, style: const TextStyle(color: Colors.red));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
