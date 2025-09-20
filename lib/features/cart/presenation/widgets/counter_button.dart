import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';

class CounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CounterButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 25.w,
      height: 25.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: isDarkMode ? MyColors.darkGrey : MyColors.lightGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 20.sp,
          color: isDarkMode ? MyColors.white : MyColors.black,
        ),
        onPressed: onTap,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        splashRadius: 20.r,
      ),
    );
  }
}
