import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import 'package:e_commerce/products/domain/entities/products.dart';
import 'package:e_commerce/products/domain/repository/base_product_repository.dart';

class GetProductSearchUseCases {
  final BaseProductRepository baseProductRepository;

  GetProductSearchUseCases(this.baseProductRepository);

  Future<Either<Failure, List<Product>>> execute() async {
    return await baseProductRepository.getProductSearch();
  }
}
