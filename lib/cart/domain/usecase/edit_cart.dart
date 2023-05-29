import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../repository/base_cart_repository.dart';
class EditOneCartUseCases {
  final BaseCartRepository baseCartRepository;

  EditOneCartUseCases(this.baseCartRepository);

  Future<Either<Failure, void>> execute({required int id,required Map<String,dynamic> body}) async {
    return await baseCartRepository.editOneCart(id: id,body: body);
  }
}