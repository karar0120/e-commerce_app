import 'package:dartz/dartz.dart';
import 'package:e_commerce/authentication/domain/repository/base_profile_repository.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import '../entities/profile.dart';

class GetOneUserUseCases {
  final BaseProfileRepository baseProfileRepository;

  GetOneUserUseCases(this.baseProfileRepository);

  Future<Either<Failure, Profile>> execute({required int id}) async {
    return await baseProfileRepository.getOneProfile(id:id);
  }
}
