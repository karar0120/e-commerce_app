// ignore_for_file: void_checks

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/exception.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import 'package:e_commerce/products/domain/entities/products.dart';
import 'package:e_commerce/products/domain/repository/base_product_repository.dart';

import '../datasource/product_remote_data_source.dart';

class ProductRepository  extends BaseProductRepository{
 final BaseProductRemoteDataSource baseProductRemoteDataSource;
  ProductRepository(this.baseProductRemoteDataSource);

  @override
  Future<Either<Failure,Product>> getOneProduct({required int id}) async{
    final result= await baseProductRemoteDataSource.getOneProduct(id: id);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure,List<Product>>> getProduct() async{
    final result= await baseProductRemoteDataSource.getProduct();
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Product>>> getProductFilter({required String filter}) async{
    final result= await baseProductRemoteDataSource.getProductFilter(categories: filter);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Product>>> getProductLimit({required int limit}) async{
    final result= await baseProductRemoteDataSource.getProductLimit(limit: limit);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Product>>> getProductSearch() async{
    final result= await baseProductRemoteDataSource.getProductSearch();
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Product>>> getProductSort({required String sort}) async{
    final result= await baseProductRemoteDataSource.getProductSort(sort: sort);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future <Either<Failure,void >> addOneProduct({required Map<String,dynamic>body})async{
    final result= await baseProductRemoteDataSource.addOneProduct(body: body);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> getCategories() async{
    final result= await baseProductRemoteDataSource.getCategories();
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOneProduct({required int id}) async{
    final result= await baseProductRemoteDataSource.deleteOneProduct(id: id);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> editOneProduct({required int id,required Map<String,dynamic>body}) async{
    final result= await baseProductRemoteDataSource.editOneProduct(id: id,body: body);
    try{
      return Right(result);
    } on ServerException catch (failure){
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}