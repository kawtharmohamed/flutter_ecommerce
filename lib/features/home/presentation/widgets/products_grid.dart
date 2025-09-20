import 'package:e_commerce_app/core/helpers/spacing.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/products_shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/theming/font_weight_helper.dart';
import '../../../../core/widges/circular_icon_button.dart';
import '../../../../core/widges/snackbar_widget.dart';
import '../../../cart/domain/entity/cart_entity.dart';
import '../../../cart/presenation/cubit/cart_cubit.dart';
import '../../../cart/presenation/cubit/cart_state.dart';
import '../cubit/ecommerce_cubit.dart';
import '../cubit/ecommerce_state.dart';
import '../cubit/navigation_cubit.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(LocaleKeys.products.tr(),
        style:  isDarkMode ? TextStyles.font20WhiteSemiBold.copyWith(fontWeight: FontWeightHelper.medium) : TextStyles.font20BlackSemiBold.copyWith(fontWeight: FontWeightHelper.medium),
              ),
            ],
          ),
          verticalSpace(15.h),
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
                return ProductsShimmer();
              } else if (state is EcommerceLoaded &&
                  state.products.isNotEmpty) {
                final products = state.products;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(
                          context,
                          Routes.productDetailPage,
                          arguments: product,
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 160.h,
                                ),
                              ),
                              BlocBuilder <CartCubit, CartState>(
                                builder: (BuildContext context, CartState state) {
                                  return Positioned(
                                    top: -12.h,
                                    right: -7.w,
                                    child: CircularIconButton(
                                      icon: Icons.favorite,
                                      onPressed: () {
                                        final cartItem = CartEntity(
                                          name: product.title,
                                          image: product.image,
                                          category: product.category,
                                          price: product.price,
                                          quantity: 1,
                                          productId: product.id,
                                        );

                                        final isInCart = context.read<CartCubit>().isInCart(product.id);
                                        if (isInCart) {
                                          final loadedState = context.read<CartCubit>().state;
                                          if (loadedState is CartLoaded) {
                                            final existingItem = loadedState.items.firstWhere((e) => e.productId == product.id);
                                            context.read<CartCubit>().removeItem(existingItem.id!);
                                          }
                                        } else {
                                          context.read<CartCubit>().addToCart(cartItem);
                                          context.read<NavigationCubit>().changeTab(2);

                                        }
                                      },
                                      isFavourite: context.watch<CartCubit>().isInCart(product.id),
                                      heartIcon: true,
                                    ),

                                  );
                                },
                              ),
                            ],
                          ),
                          verticalSpace(8.h),
                          Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,
                          ),
                          verticalSpace(4.h),
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,
                          ),
                          verticalSpace(4.h),
                          Text(
                            product.category,
                            style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                size: 20.sp,
                                color: MyColors.darkYellow,
                              ),
                              horizontalSpace(4.w),
                              Text(
                                "${product.rating.rate} (${product.rating.count})",
                                style: isDarkMode ? TextStyles.font14White : TextStyles.font14BlackMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
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
