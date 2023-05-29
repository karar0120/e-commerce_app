import 'package:dartz/dartz.dart';
import 'package:e_commerce/authentication/domain/repository/base_profile_repository.dart';

import '../../../core/utils/error/failure.dart';
import '../entities/profile.dart';
import '../entities/register.dart';

class AddOneUserUseCases {
  final BaseProfileRepository baseProfileRepository;

  AddOneUserUseCases(this.baseProfileRepository);

  Future<Either<Failure, Register>> execute({required Map<String,dynamic>body}) async {
    return await baseProfileRepository.addOneUser(body: body);
  }
}