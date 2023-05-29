
import 'package:e_commerce/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/products.dart';

class ProductState extends Equatable{
  final List<Product> allProducts;
  final RequestState productRequestState;
  final String message;

 const ProductState({
   this.allProducts=const [],
   this.productRequestState=RequestState.loading,
   this.message=''});

  @override
  List<Object?> get props => [
    allProducts,
    productRequestState,
    message,
  ];

}


