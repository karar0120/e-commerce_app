// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/exception.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/profile.dart';
import '../../domain/entities/register.dart';
import '../../domain/repository/base_profile_repository.dart';
import '../datasource/authentication_remote_data_source.dart';



class ProfileRepository  extends BaseProfileRepository{

 final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

 ProfileRepository(this.baseProfileRemoteDataSource);

  @override
  Future<Either<Failure,Profile>> getOneProfile({required int id}) async{
    final result= await baseProfileRemoteDataSource.getOneProfile(id: id);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }



  @override
  Future <Either<Failure,Register>> addOneUser({required Map<String,dynamic>body})async{
    final result= await baseProfileRemoteDataSource.addOneUser(body: body);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure, Login>> loginUser({required Map<String,dynamic>body}) async{
    final result= await baseProfileRemoteDataSource.loginUser(body: body);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}