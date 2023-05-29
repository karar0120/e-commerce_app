import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../entities/cart.dart';
import '../repository/base_cart_repository.dart';
class GetCartUseCases {
  final BaseCartRepository baseCartRepository;

  GetCartUseCases(this.baseCartRepository);

  Future<Either<Failure, List<Cart>>> execute({required int id}) async {
    return await baseCartRepository.getCart(id:id);
  }
}