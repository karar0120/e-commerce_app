import 'package:e_commerce/authentication/presentation/screen/register_screen.dart';
import 'package:e_commerce/navigation_screen.dart';
import 'package:e_commerce/products/presentation/screen/add_product_screen.dart';
import 'package:e_commerce/products/presentation/screen/edit_product_screen.dart';
import 'package:e_commerce/products/presentation/screen/one_product.dart';
import 'package:flutter/material.dart';

import '../authentication/presentation/screen/login_screen.dart';
import '../core/general_components_app/splash_screen.dart';


class ScreenRouter{
  static const String splashScreen='/';
  static const String loginScreen='/Login';
  static const String registerScreen='/Register';
  static const String mainScreen='/Main';
  static const String addProductScreen='/AddProduct';
  static const String editProductScreen='/EditProduct';
  static const String detailsProductScreen='/detailsProduct';

}



class AppRouter {

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ScreenRouter.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SplashScreen();
        });

      case ScreenRouter.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen();
        });

      case ScreenRouter.registerScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const RegisterScreen();
        });
      case ScreenRouter.mainScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const NavigationScreen();
        });
      case ScreenRouter.addProductScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const AddProductScreen();
        });
      case ScreenRouter.editProductScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const EditProductScreen();
        });
      case ScreenRouter.detailsProductScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const OneProduct();
        });
    }
  }
}