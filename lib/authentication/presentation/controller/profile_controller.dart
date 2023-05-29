import 'package:e_commerce/authentication/presentation/controller/user_state.dart';
import 'package:e_commerce/config/route.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:flutter/material.dart';
import '../../../config/user_simple_preferences.dart';
import '../../../core/utils/service_locator/service.dart';
import '../../domain/usecase/get_profile.dart';

class ProfileController with ChangeNotifier {
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

  bool _isSubmittingProfile = false;

  bool get isSubmittingProfile => _isSubmittingProfile;

  void setIsSubmittingProfile() {
    _isSubmittingProfile = !_isSubmittingProfile;
    notifyListeners();
  }

  Future profile(context) async {
    setIsSubmittingProfile();
    requestState = RequestState.loading;
    final result = await GetOneUserUseCases(sl()).execute(id:7);
    result.fold(
            (l) => UserState(
          userRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      emailTextController.text=r.email;

      passwordTextController.text=r.password;

      phoneTextController.text=r.phone;

      userNameTextController.text=r.username;

      streetTextController.text=r.address.street;

      lastNameTextController.text=r.name.lastname;


      firstNameTextController.text=r.name.firstname;

      cityTextController.text=r.address.city;

      zipCodeTextController.text=r.address.zipcode;

      numberTextController.text=r.address.number.toString();
    });
    setIsSubmittingProfile();
    requestState = RequestState.loaded;
    notifyListeners();
  }

  bool _isPasswordVisible = true;

  bool get isPasswordVisible => _isPasswordVisible;

  void setIsPasswordVisible() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void logOut(context)async{
   await UserSimplePreferences.logOut().then((value) {
     Navigator.pushNamed(context, ScreenRouter.splashScreen);
   });
  }

}
