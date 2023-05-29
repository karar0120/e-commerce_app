import 'package:e_commerce/core/general_components_app/app_bar.dart';
import 'package:e_commerce/core/style/color_consts.dart';
import 'package:e_commerce/core/style/string_consts.dart';
import 'package:e_commerce/core/style/text_style_consts.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/products/presentation/components/search_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../cart/presentation/controller/cart_controller.dart';
import '../../../core/style/sizes_consts.dart';
import '../controller/edit_product.dart';

class OneProduct extends StatelessWidget {
  const OneProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editProductController = Provider.of<EditProductController>(context);
    return Scaffold(
      appBar: GeneralAppBar(
        title: const Text(StringConsts.product),
        centerTitle: true,
        appBarColor: ColorConsts.blackColor,
      ),
      body: editProductController.requestState == RequestState.loading
          ? Center(
              child: SpinKitThreeBounce(
                color: ColorConsts.blackColor,
                size: 0.05.sw,
              ),
            )
          : Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image.network(
                  editProductController.product.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                _buildProductView(context)
              ],
            ),
    );
  }

  Widget _buildProductView(context){
    final editProductController = Provider.of<EditProductController>(context);
    final cartController = Provider.of<CartController>(context);
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(SizeConsts.s14.r)
          ,topRight:Radius.circular(SizeConsts.s14.r),),
        color: ColorConsts.grayColor,
      ),
      width: double.infinity,
      height: SizeConsts.s280.h,
      child: Padding(
        padding: const EdgeInsets.all(PaddingConsts.p8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConsts.s16.h,),
              Text(editProductController.product.title,style: TextStyleConsts.textLarge,),
              SizedBox(height: SizeConsts.s12.h,),
              Text(editProductController.product.description,overflow:TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyleConsts.textMedium,),
              SizedBox(height: SizeConsts.s12.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${StringConsts.price} : ",style: TextStyleConsts.textLarge,),
                  Text("${editProductController.product.price} \$",style: TextStyleConsts.textMedium,),
                ],
              ),
              SizedBox(height: SizeConsts.s12.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${StringConsts.categories} : ",style: TextStyleConsts.textLarge,),
                  Text(editProductController.product.category,style: TextStyleConsts.textMedium,),
                ],
              ),
              SizedBox(height: SizeConsts.s12.h,),
              InkWell(
                  onTap: (){
                    cartController.addCart(context, productId: editProductController.product.id);
                  },
                  child: GeneralButton(title:StringConsts.addToCart))
            ],
          ),
        ),
      ),
    );
  }

}
