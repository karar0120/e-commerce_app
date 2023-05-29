import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../repository/base_product_repository.dart';

class EditOneProductUseCases {
  final BaseProductRepository baseProductRepository;

  EditOneProductUseCases(this.baseProductRepository);

  Future<Either<Failure, void>> execute({required int id,required Map<String,dynamic> body}) async {
    return await baseProductRepository.editOneProduct(id: id,body: body);
  }
}