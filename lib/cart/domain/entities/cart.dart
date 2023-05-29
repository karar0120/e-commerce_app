import 'package:equatable/equatable.dart';

class  Cart extends Equatable  {
  final int id;
  final int userId;
  final String date;
  final List<Products> products;
  const Cart(
      {  required this.id,
         required this.userId,
         required this.date,
         required this.products,
       });

  @override
  List<Object?> get props => [
    id,
    userId,
    date,
    products
  ];


}

class Products  extends Equatable{
   final double productId;
   final int quantity;
   const Products ({required this.productId, required this.quantity});

  @override
  List<Object?> get props =>[
    productId,
    quantity,
  ];
}