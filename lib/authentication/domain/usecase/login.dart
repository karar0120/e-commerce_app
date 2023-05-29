import 'package:dartz/dartz.dart';

import '../../../core/utils/error/failure.dart';
import '../entities/login.dart';
import '../repository/base_profile_repository.dart';

class LoginUserUseCases {
  final BaseProfileRepository baseProfileRepository;

  LoginUserUseCases(this.baseProfileRepository);

  Future<Either<Failure, Login>> execute({required Map<String,dynamic>body}) async {
    return await baseProfileRepository.loginUser(body: body);
  }
}