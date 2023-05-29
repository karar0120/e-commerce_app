
// ignore_for_file: must_be_immutable

import 'package:e_commerce/cart/presentation/controller/cart_controller.dart';
import 'package:e_commerce/core/style/text_style_consts.dart';
import 'package:e_commerce/products/presentation/components/bottom_sheet.dart';
import 'package:e_commerce/products/presentation/components/search_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/style/sizes_consts.dart';
import '../../../products/domain/entities/products.dart';
import '../../domain/entities/cart.dart';
import 'bottom_sheet.dart';

class CartList extends StatelessWidget {
  List<Product>product;
  List<Cart>cart;

  CartList({Key? key,required this.product,required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController=Provider.of<CartController>(context);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: PaddingConsts.p10),
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: List.generate(cart.length,
                  (index) {
                   return InkWell(
                   child: CartCard(product:cartController.getProductFromCart(product,cart[index])[index],cart:cart[index].products[index],),
                   onTap: () {
                     showCustomBottomSheet(
                       context,
                       bottomSheetContent: CartBottomSheet(id:cart[index].id),
                       bottomSheetHeight: 0.27,
                     );
                   });
              })
        ));
  }
}


class CartCard extends StatelessWidget {
  Product product;
  Products cart;
   CartCard({super.key,required this.product,
     required this.cart
   });
  @override
  Widget build(BuildContext context) {
    final cartController=Provider.of<CartController>(context);
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(MarginConsts.m8),
      elevation:SizeConsts.s5,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          SizedBox(
              height:SizeConsts.s280.h,
              width: double.infinity,
              child: Image.network(
                product.image,
                )),
          Container(
            height: SizeConsts.s130.h,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(PaddingConsts.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Expanded(child: Text(product.title,style: TextStyleConsts.textLarge,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  SizedBox(height: SizeConsts.s5.h,),
                  Text("${product.category}  ",style: TextStyleConsts.textMedium,),
                  SizedBox(height: SizeConsts.s5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          cartController.subtract(quantity:cart.quantity);
                        },
                        child: GeneralSquareButton(
                         widget: const Icon(Icons.remove,color:ColorConsts.whiteColor,),
                        backgroundColor: ColorConsts.blackColor,
                        ),
                      ),
                      Text("${cart.quantity}"),
                      InkWell(
                        onTap: (){
                          cartController.add(quantity:cart.quantity);
                        },
                        child: GeneralSquareButton(
                          widget: const Icon(Icons.add,color: ColorConsts.whiteColor,),
                          backgroundColor: ColorConsts.blackColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConsts.s5.h,),
                  Text("${product.price}  \$",style: TextStyleConsts.textMedium,),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
