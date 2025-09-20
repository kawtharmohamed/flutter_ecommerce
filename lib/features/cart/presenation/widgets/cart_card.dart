import 'package:e_commerce_app/features/cart/presenation/widgets/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/theming/styles.dart';

class CartCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String collection;
  final double price;
  final int quantity;
  final bool isFavorite;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onToggleFavorite;

  const CartCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.collection,
    required this.price,
    required this.quantity,
    required this.isFavorite,
    required this.onIncrease,
    required this.onDecrease,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              imageUrl,
              width: 100.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(collection, style: isDarkMode ? TextStyles.font14White : TextStyles.font14Grey),
                Text(title, style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium.copyWith(fontWeight: FontWeightHelper.bold)),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    CounterButton( icon: Icons.remove, onTap: () { onDecrease(); },),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text("$quantity", style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,),
                    ),
                    CounterButton( icon: Icons.add, onTap: () { onIncrease(); },),],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: onToggleFavorite,
                    ),
                    const Spacer(),
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
