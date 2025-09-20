import 'package:e_commerce_app/core/localization/locale_keys.g.dart';
import 'package:e_commerce_app/features/cart/presenation/widgets/cart_summary_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widges/circular_icon_button.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/cart_state.dart';
import '../widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          LocaleKeys.cart.tr(),
          style: isDarkMode ? TextStyles.font20WhiteSemiBold : TextStyles.font20BlackSemiBold,
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: isDarkMode ? MyColors.white : MyColors.black,),
        actions: [
          CircularIconButton(icon: Icons.favorite_outline_rounded, onPressed: () {}, heartIcon: false,),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return CartCard(
                        imageUrl: item.image,
                        title: item.name,
                        collection: item.category,
                        price: item.price,
                        quantity: item.quantity,
                        isFavorite: true,
                        onIncrease: () {
                          context.read<CartCubit>().updateQuantity(item.id!, item.quantity + 1);
                        },
                        onDecrease: () {
                          if (item.quantity > 1) {
                            context.read<CartCubit>().updateQuantity(item.id!, item.quantity - 1);
                          } else {
                            context.read<CartCubit>().removeItem(item.id!);
                          }
                        },
                        onToggleFavorite: () {
                          context.read<CartCubit>().removeItem(item.id!);
                        },
                      );

                    },
                  ),
                ),
                SafeArea(child: CartSummarySection(total: state.total, itemsCount: state.items.length, onCheckout: () {})),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
