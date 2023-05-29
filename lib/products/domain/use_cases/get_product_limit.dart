import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import 'package:e_commerce/products/domain/entities/products.dart';
import 'package:e_commerce/products/domain/repository/base_product_repository.dart';

class GetProductLimitUseCases {
  final BaseProductRepository baseProductRepository;

  GetProductLimitUseCases(this.baseProductRepository);

  Future<Either<Failure, List<Product>>> execute({required int limit}) async {
    return await baseProductRepository.getProductLimit(limit: limit);
  }
}
