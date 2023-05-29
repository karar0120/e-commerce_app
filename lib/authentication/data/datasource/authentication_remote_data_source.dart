import 'package:dio/dio.dart';
import 'package:e_commerce/authentication/data/models/authetication_model.dart';
import 'package:e_commerce/authentication/data/models/register.dart';
import 'package:e_commerce/core/utils/network/api_constance.dart';
import 'package:e_commerce/core/utils/network/error_message_model.dart';
import '../../../core/utils/error/exception.dart';
import '../models/login_model.dart';

abstract class BaseProfileRemoteDataSource{
  Future <ProfileModel> getOneProfile({required int id});
  Future addOneUser({required Map<String,dynamic> body});
  Future loginUser({required Map<String,dynamic> body});
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {


  @override
  Future <ProfileModel> getOneProfile({required int id}) async {
    final response = await Dio().get('${ApiConstance.userProfile}$id');

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }






  @override
  Future addOneUser({required Map<String,dynamic>body}) async{
    final response = await Dio().post(ApiConstance.userProfile,
        data:body);
    if (response.statusCode == 200) {
     return RegisterModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

  @override
  Future loginUser({required Map<String, dynamic> body}) async{
    final response = await Dio().post(ApiConstance.userLogin
       , data: body);
    if (response.statusCode == 200) {
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}