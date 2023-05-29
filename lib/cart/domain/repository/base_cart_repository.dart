
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import '../entities/cart.dart';

abstract class BaseCartRepository{
  Future<Either<Failure,List<Cart>>> getCart({required int id});

  Future<Either<Failure,void>>addOneCart({required Map<String,dynamic>body});

  Future<Either<Failure,void>>deleteOneCart({required int id});

  Future<Either<Failure,void>>editOneCart({required int id,required Map<String,dynamic> body});


}