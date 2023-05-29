import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/network/api_constance.dart';
import 'package:e_commerce/core/utils/network/error_message_model.dart';
import 'package:e_commerce/products/data/models/product_model.dart';

import '../../../core/utils/error/exception.dart';

abstract class BaseProductRemoteDataSource{
  Future <List<ProductModel>> getProduct();
  Future <ProductModel> getOneProduct({required int id});
  Future <List<ProductModel>> getProductFilter({required String categories});
  Future <List<ProductModel>> getProductLimit({required int limit});
  Future <List<ProductModel>> getProductSearch();
  Future <List<ProductModel>> getProductSort({required String sort});
  Future addOneProduct({required Map<String,dynamic> body});
  Future <List<dynamic>> getCategories();
  Future deleteOneProduct({required int id});
  Future editOneProduct({required int id,required Map<String,dynamic> body});
}

class ProductRemoteDataSource extends BaseProductRemoteDataSource {

  @override
  Future <List<ProductModel>> getProduct() async {
    final response = await Dio().get(ApiConstance.productsPath);

    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data as List).map((e) =>
          ProductModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future <ProductModel> getOneProduct({required int id}) async {
    final response = await Dio().get('${ApiConstance.oneProductsPath}$id');

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModel>> getProductFilter(
      {required String categories}) async {
    final response = await Dio().get(
        "${ApiConstance.productsPathFilter}$categories");

    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data as List).map((e) =>
          ProductModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModel>> getProductLimit({required int limit}) async {
    final response = await Dio().get('${ApiConstance.productsPathLimit}$limit');

    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data as List).map((e) =>
          ProductModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModel>> getProductSearch() async {
    final response = await Dio().get(ApiConstance.productsPath);

    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data as List).map((e) =>
          ProductModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModel>> getProductSort({required String sort}) async {
    final response = await Dio().get('${ApiConstance.productsPathSort}$sort');

    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data as List).map((e) =>
          ProductModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future addOneProduct({required Map<String,dynamic>body}) async{

    final response = await Dio().post(ApiConstance.productsPath,
        data:body);

    if (response.statusCode == 200) {
     return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<dynamic>> getCategories() async {
    final response = await Dio().get(ApiConstance.productsPathCategories);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future deleteOneProduct({required int id}) async{
    final response = await Dio().delete('${ApiConstance.oneProductsPath}$id');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future editOneProduct({required int id, required Map<String, dynamic> body}) async{
    final response = await Dio().put('${ApiConstance.oneProductsPath}$id'
       , data: body);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}