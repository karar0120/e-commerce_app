import 'package:e_commerce/authentication/domain/usecase/add_user.dart';
import 'package:e_commerce/authentication/presentation/controller/user_state.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:flutter/material.dart';
import '../../../config/user_simple_preferences.dart';
import '../../../core/general_components_app/form_field.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/utils/service_locator/service.dart';

class RegisterController with ChangeNotifier {
  RequestState? requestState;

  TextEditingController emailTextController = TextEditingController();

  TextEditingController firstNameTextController = TextEditingController();

  TextEditingController phoneTextController = TextEditingController();

  TextEditingController userNameTextController = TextEditingController();

  TextEditingController lastNameTextController = TextEditingController();

  TextEditingController cityTextController = TextEditingController();

  TextEditingController zipCodeTextController = TextEditingController();

  TextEditingController streetTextController = TextEditingController();

  TextEditingController numberTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode firstFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  FocusNode streetFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();
  FocusNode zipCodeFocusNode = FocusNode();

  bool _isSubmittingAddUser = false;

  bool get isSubmittingAddUser => _isSubmittingAddUser;

  void setIsSubmittingAddUser() {
    _isSubmittingAddUser = !_isSubmittingAddUser;
    notifyListeners();
  }

  Future addUser(context) async {
    setIsSubmittingAddUser();
    requestState = RequestState.loading;
    Map<String, dynamic> body = {
      "email": emailTextController.text,
      "username": userNameTextController.text,
      "password": passwordTextController.text,
      'name': {
        'firstname': firstNameTextController.text,
        'lastname': lastNameTextController.text,
      },
      "address": {
        "city": cityTextController.text,
        "street": streetTextController.text,
        "number": numberTextController.text,
        "zipcode": zipCodeTextController.text,
        "geolocation": {"lat": '-37.3159', "long": '81.1496'}
      },
      "phone": phoneTextController.text,
    };
    final result = await AddOneUserUseCases(sl()).execute(body: body);
    result.fold(
        (l) => UserState(
              userRequestState: RequestState.error,
              message: l.message,
            ), (r) async {
      await UserSimplePreferences.setUseID(r.id);
      doneBotToast(title: StringConsts.savedSuccessful);
      Navigator.pop(context);
    });
    setIsSubmittingAddUser();
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
    if (emailTextController.text.isEmpty ||
        userNameTextController.text.isEmpty ||
        passwordTextController.text.isEmpty ||
        firstNameTextController.text.isEmpty ||
        lastNameTextController.text.isEmpty ||
        cityTextController.text.isEmpty ||
        streetTextController.text.isEmpty ||
        zipCodeTextController.text.isEmpty ||
        numberTextController.text.isEmpty) {
      notifyListeners();
      errorBotToast(title: StringConsts.allFieldsAreRequired);
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }
}
