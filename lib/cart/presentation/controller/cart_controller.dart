import 'package:e_commerce/config/user_simple_preferences.dart';
import 'package:e_commerce/core/style/string_consts.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:flutter/material.dart';

import '../../../core/general_components_app/form_field.dart';
import '../../../core/utils/service_locator/service.dart';
import '../../../products/domain/entities/products.dart';
import '../../domain/entities/cart.dart';
import '../../domain/usecase/add_one_cart.dart';
import '../../domain/usecase/delete_one_cart.dart';
import '../../domain/usecase/edit_cart.dart';
import '../../domain/usecase/get_cart.dart';
import 'cart_state.dart';

class CartController with ChangeNotifier {
  RequestState? requestState;

  List<Cart> allCart = [];
  List<dynamic> allCategories = [];

  Future getCart() async {
    requestState = RequestState.loading;
     late int userId;
    UserSimplePreferences.getUseID().then((value) {
      userId=value;
    });
    final result = await GetCartUseCases(sl()).execute(id:userId);
    result.fold(
        (l) => CartState(
              cartRequestState: RequestState.error,
              message: l.message,
            ), (r) {
      allCart = r;
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }


  List<Product>getProductFromCart(List<Product>allProducts,Cart cart)  {
    requestState = RequestState.loading;
    List <Product> filteredProducts = allProducts
        .where((product) => cart.products
        .any((cartProduct) => cartProduct.productId == product.id))
        .toList();
    requestState = RequestState.loaded;
    return filteredProducts;
  }


  TextEditingController titleTextController = TextEditingController();

  TextEditingController priceTextController = TextEditingController();

  TextEditingController descriptionTextController = TextEditingController();

  FocusNode titleFocusNode = FocusNode();
  FocusNode priceFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  bool _isSubmittingAddProduct = false;

  bool get isSubmittingAddProduct => _isSubmittingAddProduct;

  void setIsSubmittingAddProduct() {
    _isSubmittingAddProduct = !_isSubmittingAddProduct;
    notifyListeners();
  }

  Future addCart(context,{required int productId}) async {
    setIsSubmittingAddProduct();
    requestState = RequestState.loading;
    Map<String, dynamic> body = {
      "userId":UserSimplePreferences.getUseID(),
      "date":DateTime.now().toString(),
      "products":[{
        "productId":productId,
        "quantity":1}]
    };
    final result = await AddOneCartUseCases(sl()).execute(body: body);
    result.fold(
        (l) => CartState(
              cartRequestState: RequestState.error,
              message: l.message,
            ), (r) {
      doneBotToast(title: StringConsts.savedSuccessful);
      Navigator.pop(context);
    });
    setIsSubmittingAddProduct();
    requestState = RequestState.loaded;
    notifyListeners();
  }



  Cart? cart;


  Future deleteOneCart({required int id}) async {
    requestState = RequestState.loading;
    final result = await DeleteOneCartUseCases(sl()).execute(id:id);
    result.fold(
            (l) => CartState(
          cartRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      doneBotToast(title:StringConsts.deletedSuccessful);
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }


  TextEditingController editTitleTextController = TextEditingController();

  TextEditingController editPriceTextController = TextEditingController();

  TextEditingController editDescriptionTextController = TextEditingController();

  FocusNode editTitleFocusNode = FocusNode();
  FocusNode editPriceFocusNode = FocusNode();
  FocusNode editDescriptionFocusNode = FocusNode();
  bool _isSubmittingEditProduct = false;

  bool get isSubmittingEditProduct => _isSubmittingEditProduct;

  void setIsSubmittingEditProduct() {
    _isSubmittingEditProduct = !_isSubmittingEditProduct;
    notifyListeners();
  }

  String categoriesEditValue = '';

  void changeCategoriesEditValue(String categoriesEditValue) {
    this.categoriesEditValue = categoriesEditValue;
    notifyListeners();
  }

  Future editCart(context,{required int id}) async {
    setIsSubmittingEditProduct();
    Map<String, dynamic> body = {
      "userId":UserSimplePreferences.getUseID(),
      "date":DateTime.now().toString(),
      "products":[{"productId":1,
        "quantity":3}]
    };
    final result = await EditOneCartUseCases(sl()).execute(id:id,body: body);
    result.fold(
            (l) => CartState(
          cartRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      doneBotToast(title: StringConsts.savedSuccessful);
      Navigator.pop(context);
    });
    setIsSubmittingEditProduct();
    notifyListeners();
  }

  void add({required int quantity}){
    quantity++;
    notifyListeners();
  }
  void subtract({required int quantity}){
    quantity--;
    notifyListeners();
  }

}
