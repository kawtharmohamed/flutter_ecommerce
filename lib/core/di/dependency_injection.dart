import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/theming/theme_cubit/theme_cubit.dart';
import 'package:e_commerce_app/features/cart/domain/repository/cart_repository.dart';
import 'package:e_commerce_app/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_app/features/cart/domain/usecases/ge_cart_items_usecase.dart';
import 'package:e_commerce_app/features/cart/domain/usecases/remove_item_usecase.dart';
import 'package:e_commerce_app/features/cart/domain/usecases/update_quantity_usecase.dart';
import 'package:e_commerce_app/features/cart/presenation/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/data/repository/ecommerce_repository_impl.dart';
import 'package:e_commerce_app/features/home/domain/usecase/get_categories_usecase.dart';
import 'package:e_commerce_app/features/home/domain/usecase/get_products_usecase.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/ecommerce_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubit/navigation_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/cart/data/repository/cart_repository_impl.dart';
import '../../features/home/domain/repository/ecommerce_repository.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';
import '../theming/theme_cubit/sharedpref.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // Api & repositories
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));
  getIt.registerLazySingleton<EcommerceRepository>(() => EcommerceRepositoryImpl(getIt()));

  // UseCases
  getIt.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(getIt()));
  getIt.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(getIt()));
  getIt.registerLazySingleton<GetCartItemsUseCase>(() => GetCartItemsUseCase(getIt()));
  getIt.registerLazySingleton<UpdateQuantityUseCase>(() => UpdateQuantityUseCase(getIt()));
  getIt.registerLazySingleton<RemoveItemUseCase>(() => RemoveItemUseCase(getIt()));
  getIt.registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(getIt()));

  // Cubits
  getIt.registerLazySingleton<EcommerceCubit>(() => EcommerceCubit(getIt(), getIt()));
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());
  getIt.registerLazySingleton<CartCubit>(() => CartCubit(getIt(), getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<NavigationCubit>(() => NavigationCubit());

  // Theme
  getIt.registerLazySingleton<ThemePreferences>(() => ThemePreferences(getIt()));
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt()));
}
