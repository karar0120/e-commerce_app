
// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/style/text_style_consts.dart';
import 'package:e_commerce/products/presentation/controller/delete_product.dart';
import 'package:e_commerce/products/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../config/route.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/style/sizes_consts.dart';
import '../../../core/style/string_consts.dart';
import '../controller/edit_product.dart';
void showCustomBottomSheet
    (BuildContext context, {required Widget bottomSheetContent,
  required double bottomSheetHeight}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(SizeConsts.s20))),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: bottomSheetHeight.sh,
          child: Stack(
            children: [
              Positioned(
                right: 0.4.sw,
                left: 0.4.sw,
                top: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: SizeConsts.s5,
                  decoration: BoxDecoration(
                      color: ColorConsts.blackColor,
                      borderRadius: BorderRadius.circular(SizeConsts.s20)),
                ),
              ),
              bottomSheetContent
            ],
          ),
        );
      });
}


class ProductBottomSheet extends StatelessWidget {
  int id;
   ProductBottomSheet({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    final deleteProductController = Provider.of<DeleteProductController>(context);
    final editProductController=Provider.of<EditProductController>(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: PaddingConsts.p40, vertical: PaddingConsts.p40),
      children: [
        InkWell(
          onTap: (){
            Navigator.pop(context);
            editProductController.getOneProduct(id: id);
            Navigator.pushNamed(context,ScreenRouter.detailsProductScreen);
            },
          child: Padding(
            padding:const EdgeInsets.symmetric(vertical: PaddingConsts.p10),
            child: Center(
              child: Text(StringConsts.view,
                  style:TextStyleConsts.textMedium),
            ),
          ),
        ),
        const Divider(),
        InkWell(
          onTap: (){
            Navigator.pop(context);
            editProductController.getOneProduct(id: id);
            Navigator.pushNamed(context,ScreenRouter.editProductScreen);
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
            deleteProductController.deleteOneProduct(id:id);
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



class FilterBottomSheet extends StatelessWidget {
 const FilterBottomSheet({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: PaddingConsts.p40, vertical: PaddingConsts.p40),
      children: [
        _buildDropDownLimit(context),
        const Divider(),
        _buildDropDownCategories(context),
        const Divider(),
        _buildDropDownSort(context),
      ],
    );
  }

 Widget _buildDropDownCategories(context){
   final productController = Provider.of<ProductController>(context);
   return DropdownButtonFormField(
       decoration: InputDecoration(
         filled: true,
         label: const Text(StringConsts.categories),
         labelStyle: TextStyleConsts.textMedium,
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(6.0),
           borderSide: const BorderSide(
             color: ColorConsts.whiteColor,
           ),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(6),
           borderSide: const BorderSide(
             color: ColorConsts.whiteColor,
             // width: 1.0,
           ),
         ),
         border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(5.0)),
         contentPadding: const EdgeInsets.all(10),
       ),
       isExpanded: true,
       icon: const Icon(Icons.arrow_drop_down_circle),
       items: productController.allCategories.map<
           DropdownMenuItem<dynamic>>(
               (dynamic value) {
             return DropdownMenuItem<dynamic>(
               value: value,
               child: Text(value),
             );
           }).toList(),
       value: productController.categoriesInit,
       onChanged: (val){
         productController.categoriesInit=val!;
         productController.getProductFilter(sort: val);
       });
 }


 Widget _buildDropDownLimit(context){
   final productController = Provider.of<ProductController>(context);
   return DropdownButtonFormField(
       decoration: InputDecoration(
         filled: true,
         label: const Text(StringConsts.limit),
         labelStyle: TextStyleConsts.textMedium,
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(6.0),
           borderSide: const BorderSide(
             color: ColorConsts.whiteColor,
           ),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(6),
           borderSide: const BorderSide(
             color: ColorConsts.whiteColor,
             // width: 1.0,
           ),
         ),
         border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(5.0)),
         contentPadding: const EdgeInsets.all(10),
       ),
       isExpanded: true,
       icon: const Icon(Icons.arrow_drop_down_circle),
       items: productController.limit.map<
           DropdownMenuItem<int>>(
               (int value) {
             return DropdownMenuItem<int>(
               value: value,
               child: Text("$value"),
             );
           }).toList(),
       value: productController.limitValue,
       onChanged: (val){
         productController.limitValue=val!;
         productController.getProductLimit(limit: val);
       });
 }


 Widget _buildDropDownSort(context){
   final productController = Provider.of<ProductController>(context);
   return DropdownButtonFormField(
       decoration: InputDecoration(
         filled: true,
         label: const Text(StringConsts.categories),
         labelStyle: TextStyleConsts.textMedium,
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(6.0),
           borderSide: const BorderSide(
             color: ColorConsts.whiteColor,
           ),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(6),
           borderSide: const BorderSide(
             color: ColorConsts.whiteColor,
             // width: 1.0,
           ),
         ),
         border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(5.0)),
         contentPadding: const EdgeInsets.all(10),
       ),
       isExpanded: true,
       icon: const Icon(Icons.arrow_drop_down_circle),
       items: productController.sortType.map<
           DropdownMenuItem<String>>(
               (dynamic value) {
             return DropdownMenuItem<String>(
               value: value,
               child: Text(value),
             );
           }).toList(),
       value:productController.sortTypeInit ,
       onChanged: (val){
         productController.sortTypeInit=val!;
         productController.getProductSort(sort: val);
       });
 }

}

