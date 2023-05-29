import 'package:e_commerce/core/style/sizes_consts.dart';
import 'package:e_commerce/core/style/text_style_consts.dart';
import 'package:e_commerce/products/presentation/components/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../config/route.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/utils/enums.dart';
import '../components/product_item.dart';
import '../components/search_components.dart';
import '../controller/product_controller.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController=Provider.of<ProductController>(context);
    return productController.requestState == RequestState.loading
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
            _buildIntro(context),
            SizedBox(
              height: SizeConsts.s10.h,
            ),
             _buildSearch(context),
            ProductList(product:productController.allProduct),
          ],
        ),
      ),
    );
  }

 Widget _buildIntro(context){
   final productController=Provider.of<ProductController>(context);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello Natasha",style: TextStyleConsts.textLarge,),
            SizedBox(
              height: SizeConsts.s4.h,
            ),
            Text(StringConsts.findYourFavouriteProductHere,
              style: TextStyleConsts.textSmall,),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: (){
            Navigator.pushNamed(context,ScreenRouter.addProductScreen);
            productController.getCategories();
            },
          child: GeneralSquareButton(widget:const Icon(Icons.add,color: ColorConsts.whiteColor,)
            ,backgroundColor: ColorConsts.blackColor,),
        ),
        const SizedBox(width: SizeConsts.s4,),
        InkWell(
          onTap: (){
          showCustomBottomSheet(context,
              bottomSheetContent: const FilterBottomSheet(),
              bottomSheetHeight: 0.35);
          },
          child: GeneralSquareButton(widget:const Icon(Icons.sort,color: ColorConsts.whiteColor,)
            ,backgroundColor: ColorConsts.blackColor,),
        )
      ],
    );
 }

 Widget _buildSearch(context){

   final productController=Provider.of<ProductController>(context);
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        children: [
          Expanded(
            child: SearchFormField(
              controller: productController.searchController,
              type: TextInputType.text,
              onSubmit: (){},
              onChange:(){
                productController.getProductSearch();
              },
              focusNode: productController.searchNode,
              onTap: (){},
              validate:(){},
              hintText: 'Search',
              prefixPressed:(){},
              suffixPressed: (){},),
          ),
          SearchButton(
            width:SizeConsts.s40,
            height:SizeConsts.s45,
            buttonBackgroundColor:ColorConsts.blackColor,
            iconOrTitle: const Icon(Icons.search,color:ColorConsts. whiteColor,) ,)
        ],
      ),
    );
 }
}



