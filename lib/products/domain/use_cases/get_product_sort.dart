import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import 'package:e_commerce/products/domain/entities/products.dart';
import 'package:e_commerce/products/domain/repository/base_product_repository.dart';

class GetProductSortUseCases {
  final BaseProductRepository baseProductRepository;

  GetProductSortUseCases(this.baseProductRepository);

  Future<Either<Failure, List<Product>>> execute({required String sort}) async {
    return await baseProductRepository.getProductSort(sort:sort);
  }
}
