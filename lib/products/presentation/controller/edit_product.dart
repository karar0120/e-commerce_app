import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/products/domain/use_cases/get_one_product.dart';
import 'package:e_commerce/products/presentation/controller/product_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/general_components_app/form_field.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/utils/service_locator/service.dart';
import '../../domain/entities/products.dart';

import '../../domain/use_cases/edit_product.dart';

import '../components/image.dart';

class EditProductController with ChangeNotifier {
  RequestState? requestState;


  late Product product;

  Future getOneProduct({required int id}) async {
    requestState = RequestState.loading;
    final result = await GetOneProductUseCases(sl()).execute(id:id);
    result.fold(
            (l) => ProductState(
          productRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      product=r;
      editTitleTextController.text=product.title;
      editDescriptionTextController.text=product.description;
      editPriceTextController.text=product.price.toString();
      categoriesEditValue =product.category;
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

  Future editProduct(context,{required int id}) async {
    setIsSubmittingEditProduct();
    final imageFile =
    Provider.of<ImagePickerController>(context, listen: false);
    Map<String, dynamic> body = {
      "title": editTitleTextController.text,
      "price": editPriceTextController.text,
      "description": editDescriptionTextController.text,
      "image": imageFile.imagePicked?.path??product.image,
      "category": categoriesEditValue
    };
    final result = await EditOneProductUseCases(sl()).execute(id:id,body: body);
    result.fold(
            (l) => ProductState(
          productRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      doneBotToast(title: StringConsts.savedSuccessful);
      Navigator.pop(context);
    });
    setIsSubmittingEditProduct();
    notifyListeners();
  }





}
