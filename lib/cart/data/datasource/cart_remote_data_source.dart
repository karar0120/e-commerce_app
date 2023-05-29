import 'package:dio/dio.dart';
import 'package:e_commerce/cart/data/models/cart_model.dart';
import 'package:e_commerce/core/utils/network/api_constance.dart';
import 'package:e_commerce/core/utils/network/error_message_model.dart';
import '../../../core/utils/error/exception.dart';

abstract class BaseCartRemoteDataSource{
  Future <List<CartModel>> getCart({required int id});
  Future addOneCart({required Map<String,dynamic> body});
  Future deleteOneCart({required int id});
  Future editOneCart({required int id,required Map<String,dynamic> body});
}

class CartRemoteDataSource extends BaseCartRemoteDataSource {

  @override
  Future <List<CartModel>> getCart({required int id}) async {
    final response = await Dio().get("${ApiConstance.cartPathUser}$id");

    if (response.statusCode == 200) {
      return List<CartModel>.from((response.data as List).map((e) =>
          CartModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }



  @override
  Future addOneCart({required Map<String,dynamic>body}) async{

    final response = await Dio().post(ApiConstance.cartPath,
        data:body);

    if (response.statusCode == 200) {
     return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }


  @override
  Future deleteOneCart({required int id}) async{
    final response = await Dio().delete('${ApiConstance.cartPath}/$id');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future editOneCart({required int id, required Map<String, dynamic> body}) async{
    final response = await Dio().put('${ApiConstance.cartPath}/$id'
       , data: body);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}