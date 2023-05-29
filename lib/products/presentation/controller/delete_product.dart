import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/products/presentation/controller/product_state.dart';
import 'package:flutter/material.dart';
import '../../../core/general_components_app/form_field.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/utils/service_locator/service.dart';
import '../../domain/use_cases/delete_one_product.dart';


class DeleteProductController with ChangeNotifier {
  RequestState? requestState;



  Future deleteOneProduct({required int id}) async {
    requestState = RequestState.loading;
    final result = await DeleteOneProductUseCases(sl()).execute(id:id);
    result.fold(
            (l) => ProductState(
          productRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      doneBotToast(title: StringConsts.deletedSuccessful);
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }


}
