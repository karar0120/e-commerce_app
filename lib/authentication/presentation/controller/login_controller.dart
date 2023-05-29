
import 'package:e_commerce/authentication/domain/usecase/login.dart';
import 'package:e_commerce/authentication/presentation/controller/user_state.dart';
import 'package:e_commerce/config/route.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:flutter/material.dart';
import '../../../config/user_simple_preferences.dart';
import '../../../core/general_components_app/form_field.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/utils/service_locator/service.dart';

class LoginController with ChangeNotifier {
  RequestState? requestState;


  TextEditingController userNameTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  FocusNode userNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool _isSubmittingLogin = false;

  bool get isSubmittingLogin => _isSubmittingLogin;

  void setIsSubmittingLogin() {
    _isSubmittingLogin = !_isSubmittingLogin;
    notifyListeners();
  }

  Future login(context) async {
    setIsSubmittingLogin();
    requestState = RequestState.loading;
    Map<String, dynamic> body = {
      "username": userNameTextController.text,
      "password": passwordTextController.text,
    };
    final result = await LoginUserUseCases(sl()).execute(body: body);
    result.fold(
            (l) => UserState(
          userRequestState: RequestState.error,
          message: l.message,
        ), (r) async{
     await UserSimplePreferences.setToken(r.token);
     Navigator.pushNamed(context, ScreenRouter.mainScreen);
    });
    setIsSubmittingLogin();
    requestState = RequestState.loaded;
    notifyListeners();
  }

  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void setIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool setIsSubmitting() {
    if (userNameTextController.text.isEmpty ||
        passwordTextController.text.isEmpty
        ) {
      notifyListeners();
      errorBotToast(title: StringConsts.allFieldsAreRequired);
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

}
