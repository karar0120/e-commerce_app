import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import 'package:e_commerce/products/domain/entities/products.dart';
import 'package:e_commerce/products/domain/repository/base_product_repository.dart';

class GetOneProductUseCases {
  final BaseProductRepository baseProductRepository;

  GetOneProductUseCases(this.baseProductRepository);

  Future<Either<Failure, Product>> execute({required int id}) async {
    return await baseProductRepository.getOneProduct(id:id);
  }
}
