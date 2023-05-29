import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import 'package:e_commerce/products/domain/entities/products.dart';
import 'package:e_commerce/products/domain/repository/base_product_repository.dart';

class GetProductFilterUseCases {
  final BaseProductRepository baseProductRepository;

  GetProductFilterUseCases(this.baseProductRepository);

  Future<Either<Failure, List<Product>>> execute({required String filter}) async {
    return await baseProductRepository.getProductFilter(filter: filter);
  }
}
