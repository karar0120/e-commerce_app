
// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/style/text_style_consts.dart';
import 'package:e_commerce/products/presentation/components/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/sizes_consts.dart';
import '../../domain/entities/products.dart';
class ProductList extends StatelessWidget {
  List<Product>product;

  ProductList({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: PaddingConsts.p10),
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: List.generate(product.length,
                  (index) {
               return InkWell(
                   child: ProductCard(product:product[index],),
                   onTap: () {
                     showCustomBottomSheet(
                       context,
                       bottomSheetContent: ProductBottomSheet(id:product[index].id),
                       bottomSheetHeight: 0.27,
                     );
                   });
              })
        ));
  }
}


class ProductCard extends StatelessWidget {
  Product product;
   ProductCard({super.key,required this.product});
  @override
  Widget build(BuildContext context) {
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
                  Expanded(child: Text(product.description,style: TextStyleConsts.textMedium,overflow: TextOverflow.ellipsis,maxLines: 2,)),
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
