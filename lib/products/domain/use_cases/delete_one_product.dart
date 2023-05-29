import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../repository/base_product_repository.dart';

class DeleteOneProductUseCases {
  final BaseProductRepository baseProductRepository;

  DeleteOneProductUseCases(this.baseProductRepository);

  Future<Either<Failure, void>> execute({required int id}) async {
    return await baseProductRepository.deleteOneProduct(id: id);
  }
}