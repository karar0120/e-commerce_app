import 'package:e_commerce/cart/presentation/controller/cart_controller.dart';
import 'package:e_commerce/core/style/sizes_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/utils/enums.dart';
import '../../../products/presentation/controller/product_controller.dart';
import '../components/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController=Provider.of<CartController>(context);
    final productController=Provider.of<ProductController>(context);
    return cartController.requestState == RequestState.loading
        ? Center(
      child: SpinKitThreeBounce(
        color: ColorConsts.blackColor,
        size: 0.05.sw,
      ),
    ):Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConsts.s10.h,
            ),
            CartList(product:productController.allProduct, cart: cartController.allCart,),
          ],
        ),
      ),
    );
  }

}



