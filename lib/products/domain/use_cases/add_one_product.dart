import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../repository/base_product_repository.dart';

class AddOneProductUseCases {
  final BaseProductRepository baseProductRepository;

  AddOneProductUseCases(this.baseProductRepository);

  Future<Either<Failure, void>> execute({required Map<String,dynamic>body}) async {
    return await baseProductRepository.addOneProduct(body: body);
  }
}