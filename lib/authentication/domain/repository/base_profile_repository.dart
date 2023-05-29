
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import '../entities/login.dart';
import '../entities/profile.dart';
import '../entities/register.dart';

abstract class BaseProfileRepository{

  Future<Either<Failure,Profile>>getOneProfile({required int id});

  Future<Either<Failure,Register>>addOneUser({required Map<String,dynamic>body});

  Future<Either<Failure,Login>>loginUser({required Map<String,dynamic> body});


}