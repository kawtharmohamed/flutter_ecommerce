import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/features/cart/presenation/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/pages/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/cart/presenation/pages/cart_page.dart';
import '../../features/home/domain/entity/product_entity.dart';
import '../../features/home/presentation/cubit/navigation_cubit.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/product_detail_page.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.mainLayoutPage:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => NavigationCubit(),
                child: const MainLayout(),
              ),
        );

      case Routes.cartPage:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider.value(
                value: context.read<CartCubit>(), // reuse existing
                child: const CartPage(),
              ),
        );

      case Routes.productDetailPage:
        final product = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (_) => ProductDetailPage(product: product),
        );
    }
    return null;
  }
}
