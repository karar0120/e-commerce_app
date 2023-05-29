import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../repository/base_cart_repository.dart';

class DeleteOneCartUseCases {
  final BaseCartRepository baseCartRepository;

  DeleteOneCartUseCases(this.baseCartRepository);

  Future<Either<Failure, void>> execute({required int id}) async {
    return await baseCartRepository.deleteOneCart(id: id);
  }
}