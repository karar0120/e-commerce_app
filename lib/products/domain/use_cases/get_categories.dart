import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../repository/base_product_repository.dart';

class GetCategoriesUseCases {
  final BaseProductRepository baseProductRepository;

  GetCategoriesUseCases(this.baseProductRepository);

  Future<Either<Failure, List<dynamic>>> execute() async {
    return await baseProductRepository.getCategories();
  }
}