import '../../domain/entities/cart.dart';

class CartModel extends Cart{
  const CartModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.products,
  });


  factory CartModel.fromJson(Map<String,dynamic>json){
    return CartModel(
        id: json['id'],
        userId: json['userId'],
        date: json['date'],
        products: List<ProductModal>.from(
          json["products"].map((x) => ProductModal.fromJson(x))),
  );}

}

class ProductModal extends Products {
  const ProductModal({
    required super.productId,
    required super.quantity});

 factory ProductModal.fromJson(Map<String, dynamic> json) {
   return  ProductModal(
       productId: json['productId'].toDouble(),
       quantity : json['quantity'],
    );
  }

}