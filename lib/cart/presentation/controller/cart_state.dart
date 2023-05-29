import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/cart.dart';


class CartState extends Equatable{
  final List<Cart> allCart;
  final RequestState cartRequestState;
  final String message;

  const CartState({
    this.allCart=const [],
    this.cartRequestState=RequestState.loading,
    this.message=''});

  @override
  List<Object?> get props => [
    allCart,
    cartRequestState,
    message,
  ];

}