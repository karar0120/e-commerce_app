
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/error/failure.dart';
import 'package:e_commerce/products/domain/entities/products.dart';

abstract class BaseProductRepository{
  Future<Either<Failure,List<Product>>> getProduct();

  Future<Either<Failure,List<Product>>>getProductSearch();

  Future<Either<Failure,List<Product>>>getProductSort({required String sort});

  Future<Either<Failure,List<Product>>>getProductLimit({required int limit});

  Future<Either<Failure,List<Product>>>getProductFilter({required String filter});

  Future<Either<Failure,Product>>getOneProduct({required int id});

  Future<Either<Failure,void>>addOneProduct({required Map<String,dynamic>body});

  Future<Either<Failure,List<dynamic>>>getCategories();

  Future<Either<Failure,void>>deleteOneProduct({required int id});

  Future<Either<Failure,void>>editOneProduct({required int id,required Map<String,dynamic> body});


}