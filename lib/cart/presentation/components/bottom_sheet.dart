
// ignore_for_file: must_be_immutable

import 'package:e_commerce/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/style/sizes_consts.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/style/text_style_consts.dart';

class CartBottomSheet extends StatelessWidget {
  int id;
  CartBottomSheet({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: PaddingConsts.p40, vertical: PaddingConsts.p40),
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
            cartController.editCart(context,id:id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: PaddingConsts.p10),
            child: Center(
              child: Text(StringConsts.edit,
                  style:TextStyleConsts.textMedium),
            ),
          ),
        ),
        const Divider(),
        InkWell(
          onTap: (){
            Navigator.pop(context);
            cartController.deleteOneCart(id:id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: PaddingConsts.p10),
            child: Center(
              child: Text(StringConsts.delete,
                  style:TextStyleConsts.textMedium.copyWith(color: Colors.red)),
            ),
          ),
        ),
      ],
    );
  }
}
