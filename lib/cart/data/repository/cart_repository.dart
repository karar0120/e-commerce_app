// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/exception.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import '../../domain/entities/cart.dart';
import '../../domain/repository/base_cart_repository.dart';
import '../datasource/cart_remote_data_source.dart';

class CartRepository  extends BaseCartRepository{
 final BaseCartRemoteDataSource baseCartRemoteDataSource;

 CartRepository(this.baseCartRemoteDataSource);

  @override
  Future<Either<Failure,List<Cart>>> getCart({required int id}) async{
    final result= await baseCartRemoteDataSource.getCart(id: id);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }



  @override
  Future <Either<Failure,void >> addOneCart({required Map<String,dynamic>body})async{
    final result= await baseCartRemoteDataSource.addOneCart(body: body);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOneCart({required int id}) async{
    final result= await baseCartRemoteDataSource.deleteOneCart(id: id);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> editOneCart({required int id,required Map<String,dynamic>body}) async{
    final result= await baseCartRemoteDataSource.editOneCart(id: id,body: body);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}