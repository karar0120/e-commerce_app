
import 'package:e_commerce/authentication/domain/usecase/login.dart';
import 'package:e_commerce/products/data/datasource/product_remote_data_source.dart';
import 'package:e_commerce/products/data/repository/product_repository.dart';
import 'package:e_commerce/products/domain/repository/base_product_repository.dart';
import 'package:e_commerce/products/domain/use_cases/get_product.dart';
import 'package:get_it/get_it.dart';

import '../../../authentication/data/datasource/authentication_remote_data_source.dart';
import '../../../authentication/data/repository/authentication_repository.dart';
import '../../../authentication/domain/repository/base_profile_repository.dart';
import '../../../cart/data/datasource/cart_remote_data_source.dart';
import '../../../cart/data/repository/cart_repository.dart';
import '../../../cart/domain/repository/base_cart_repository.dart';
import '../../../cart/domain/usecase/get_cart.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init() {
   ///Use Cases
    sl.registerLazySingleton(() =>GetProductUseCases(sl()));

    ///  repository
    sl.registerLazySingleton<BaseProductRepository>(() => ProductRepository(sl()));

    /// Data Source

    sl.registerLazySingleton<BaseProductRemoteDataSource>(() => ProductRemoteDataSource());


    ///Use Cases
    sl.registerLazySingleton(() =>GetCartUseCases(sl()));

    ///  repository
    sl.registerLazySingleton<BaseCartRepository>(() => CartRepository(sl()));

    /// Data Source

    sl.registerLazySingleton<BaseCartRemoteDataSource>(() => CartRemoteDataSource());



    ///Use Cases
    sl.registerLazySingleton(() =>LoginUserUseCases(sl()));

    ///  repository
    sl.registerLazySingleton<BaseProfileRepository>(() => ProfileRepository(sl()));

    /// Data Source

    sl.registerLazySingleton<BaseProfileRemoteDataSource>(() => ProfileRemoteDataSource());

  }
}