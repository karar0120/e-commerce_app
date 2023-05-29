import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../repository/base_cart_repository.dart';


class AddOneCartUseCases {
  final BaseCartRepository baseCartRepository;

  AddOneCartUseCases(this.baseCartRepository);

  Future<Either<Failure, void>> execute({required Map<String,dynamic>body}) async {
    return await baseCartRepository.addOneCart(body: body);
  }
}