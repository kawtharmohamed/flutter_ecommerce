import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theme_cubit/theme_cubit.dart';
import '../../../../core/theming/theme_cubit/theme_state.dart';
import '../../../../core/widges/alter_dialog.dart';
import '../../../../core/widges/circular_icon_button.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/categories_list.dart';
import '../widgets/location_section.dart';
import '../widgets/products_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 40.w,
              height: 40.h,
            ),
            SizedBox(width: 8.w),
            Text(LocaleKeys.ecommerce_app.tr(),
              style: isDarkMode ? TextStyles.font20WhiteSemiBold : TextStyles.font20BlackSemiBold,
            ),
          ],
        ),
        actions: [
          CircularIconButton(
            icon: Icons.language,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => chooseLanguageDialog(
                  onPressed1: () {
                    context.setLocale(const Locale('en'));
                    Navigator.pop(context);
                  },
                  onPressed2: () {
                    context.setLocale(const Locale('ar'));
                    Navigator.pop(context);
                  },
                ),
              );

            },
            heartIcon: false,
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final isDark = state is ThemeChanged ? state.isDark : false;
              return CircularIconButton(
                icon: isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).changeTheme();
                },
                heartIcon: false,
              );
            },
          ),
        ],

      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(30.h),
                    LocationSection(),
                    verticalSpace(30.h),
                    BannerCarousel(),
                    verticalSpace(30.h),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: CategoriesList(),),
            SliverToBoxAdapter(child: verticalSpace(20.h)),
            SliverToBoxAdapter(child: ProductsGrid(),),
          ],
        ),
      ),
    );
  }
}

