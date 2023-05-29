import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/products/presentation/controller/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/general_components_app/form_field.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/utils/service_locator/service.dart';
import '../../domain/use_cases/add_one_product.dart';
import '../components/image.dart';

class AddProductController with ChangeNotifier {
  RequestState? requestState;

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

  Future addProduct(context) async {
    setIsSubmittingAddProduct();
    requestState = RequestState.loading;
    final imageFile =
    Provider.of<ImagePickerController>(context, listen: false);
    Map<String, dynamic> body = {
      "title": titleTextController.text,
      "price": priceTextController.text,
      "description": descriptionTextController.text,
      "image": imageFile.imagePicked!.path,
      "category": categoriesValue
    };
    final result = await AddOneProductUseCases(sl()).execute(body: body);
    result.fold(
            (l) => ProductState(
          productRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      doneBotToast(title: StringConsts.savedSuccessful);
      Navigator.pop(context);
    });
    setIsSubmittingAddProduct();
    requestState = RequestState.loaded;
    notifyListeners();
  }



  String categoriesValue = '';

  void changeCategoriesValue(String categoriesValue) {
    this.categoriesValue = categoriesValue;
    notifyListeners();
  }

  bool setIsSubmitting() {
    if (titleTextController.text.isEmpty ||
        priceTextController.text.isEmpty ||
        descriptionTextController.text.isEmpty) {
      notifyListeners();
      errorBotToast(title: StringConsts.allFieldsAreRequired);
      return false;
    } else {
      notifyListeners();
      return true;
    }
  }

}
