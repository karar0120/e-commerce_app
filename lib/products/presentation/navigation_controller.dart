
import 'package:e_commerce/authentication/presentation/screen/peofile_screen.dart';
import 'package:e_commerce/cart/presentation/screen/cart_screen.dart';
import 'package:e_commerce/products/presentation/screen/production_screen.dart';
import 'package:flutter/material.dart';

import '../../core/style/string_consts.dart';

class ChangeIndexController with ChangeNotifier {

  List<Widget>body=const [
    ProductsScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  List<String>appBatTitle=const [
    StringConsts.product,
    StringConsts.cart,
    StringConsts.profile,
  ];

  int index = 0;
  void changeIndexFunction(int index) {
    this.index = index;
    notifyListeners();
  }

}
