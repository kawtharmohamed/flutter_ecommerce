import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/features/cart/presenation/pages/cart_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/theming/styles.dart';
import '../../../cart/presenation/cubit/cart_cubit.dart';
import '../cubit/ecommerce_cubit.dart';
import '../cubit/navigation_cubit.dart';
import '../pages/home_page.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<Widget> screens = [
      const HomePage(),
      const HomePage(),
      const CartPage(),
      const HomePage(),
    ];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<EcommerceCubit>()..fetchCategories()..fetchProducts(),),
        BlocProvider(create: (context) => getIt<CartCubit>()..loadCart(),),
      ],
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              color: isDarkMode ? MyColors.black : Colors.white,
              child: screens[state],
            ),
            bottomNavigationBar: Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: isDarkMode ? MyColors.black : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    context,
                    index: 0,
                    icon: Icons.home,
                    label: LocaleKeys.home.tr(),
                    isSelected: state == 0,
                    isDarkMode: isDarkMode,
                  ),
                  _buildNavItem(
                    context,
                    index: 1,
                    icon: Icons.category,
                    label: LocaleKeys.categories.tr(),
                    isSelected: state == 1,
                    isDarkMode: isDarkMode,
                  ),
                  _buildNavItem(
                    context,
                    index: 2,
                    icon: Icons.favorite,
                    label: LocaleKeys.favorites.tr(),
                    isSelected: state == 2,
                    isDarkMode: isDarkMode,
                  ),
                  _buildNavItem(
                    context,
                    index: 3,
                    icon: Icons.person,
                    label: LocaleKeys.profile.tr(),
                    isSelected: state == 3,
                    isDarkMode: isDarkMode,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, {
        required int index,
        required IconData icon,
        required String label,
        required bool isSelected,
        required bool isDarkMode,
      }) {
    return GestureDetector(
      onTap: () => context.read<NavigationCubit>().changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDarkMode ? MyColors.darkGrey : MyColors.mainColor)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? (isDarkMode ? Colors.white : MyColors.white)
                  : (isDarkMode ? Colors.grey : MyColors.grey),
            ),
            if (isSelected) ...[
              horizontalSpace(8.w),
              Text(
                label,
                style: TextStyles.font14White.copyWith(
                  fontWeight: FontWeightHelper.bold,
                  color: isDarkMode ? Colors.white : MyColors.white,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

