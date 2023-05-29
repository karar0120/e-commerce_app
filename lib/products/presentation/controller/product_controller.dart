import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/products/domain/use_cases/get_categories.dart';
import 'package:e_commerce/products/presentation/controller/product_state.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/service_locator/service.dart';
import '../../domain/entities/products.dart';
import '../../domain/use_cases/get_product.dart';
import '../../domain/use_cases/get_product_filter.dart';
import '../../domain/use_cases/get_product_limit.dart';
import '../../domain/use_cases/get_product_sort.dart';

class ProductController with ChangeNotifier {
  RequestState? requestState;

  List<Product> allProduct = [];
  List<dynamic> allCategories = [];
  List <int>limit=[1,2,3,4,5];
  List <String>sortType=['asc','desc'];
  List<Product>searchProducts=[];

  int limitValue = 1 ;
  String sortTypeInit='asc';
  String categoriesInit='electronics';
  Future getProduct() async {
    requestState = RequestState.loading;
    final result = await GetProductUseCases(sl()).execute();
    result.fold(
        (l) => ProductState(
              productRequestState: RequestState.error,
              message: l.message,
            ), (r) {
      allProduct = r;
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }

  Future getCategories() async {
    requestState = RequestState.loading;
    final result = await GetCategoriesUseCases(sl()).execute();
    result.fold(
        (l) => ProductState(
              productRequestState: RequestState.error,
              message: l.message,
            ), (r) {
      allCategories = r;
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }

  Future getProductSort({required String sort}) async {
    requestState = RequestState.loading;
    final result = await GetProductSortUseCases(sl()).execute(sort: sort);
    allProduct.clear();
    result.fold(
            (l) => ProductState(
          productRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      allProduct = r;
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }

  Future getProductFilter({required String sort}) async {
    requestState = RequestState.loading;
    final result = await GetProductFilterUseCases(sl()).execute(filter: sort);
    allProduct.clear();
    result.fold(
            (l) => ProductState(
          productRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      allProduct = r;
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }


  Future getProductLimit({required int  limit}) async {
    requestState = RequestState.loading;
    final result = await GetProductLimitUseCases(sl()).execute(limit: limit);
    allProduct.clear();
    result.fold(
            (l) => ProductState(
          productRequestState: RequestState.error,
          message: l.message,
        ), (r) {
      allProduct = r;
    });
    requestState = RequestState.loaded;
    notifyListeners();
  }
  TextEditingController searchController=TextEditingController();
  FocusNode searchNode=FocusNode();
  void getProductSearch() async {
    searchProducts.clear();
    searchProducts=allProduct;
    if (searchController.text.isEmpty){
      getProduct();
    }
    allProduct= searchProducts.where((element){
      return element.title.toLowerCase().contains(searchController.text.toLowerCase());
    }).toList();
    requestState = RequestState.loaded;
    notifyListeners();
  }

}
