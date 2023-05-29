import 'package:e_commerce/core/general_components_app/app_bar.dart';
import 'package:e_commerce/core/style/color_consts.dart';
import 'package:e_commerce/core/style/sizes_consts.dart';
import 'package:e_commerce/core/style/string_consts.dart';
import 'package:e_commerce/core/style/text_style_consts.dart';
import 'package:e_commerce/products/presentation/controller/add_product.dart';
import 'package:e_commerce/products/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../core/general_components_app/form_field.dart';
import '../components/image.dart';
import '../components/search_components.dart';
class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final addProductController = Provider.of<AddProductController>(context);
    return Scaffold(
      appBar: GeneralAppBar(
        title: const Text(StringConsts.addProduct),
        centerTitle: true,
        appBarColor: ColorConsts.blackColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(PaddingConsts.p10),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: SizeConsts.s8.h,),
              _buildFormField(context),
              SizedBox(height: SizeConsts.s8.h,),
              const AddProductPhoto(),
              SizedBox(height: SizeConsts.s8.h,),
              _buildDropDown(context),
              SizedBox(height: SizeConsts.s20.h,),
              addProductController.isSubmittingAddProduct?
              SpinKitThreeBounce(
                color: ColorConsts.blackColor,
                size: 0.08.sw,
              ):  InkWell(
                  onTap: (){
                   if (addProductController.setIsSubmitting()){
                     addProductController.addProduct(context);
                   }
                  },
                  child: GeneralButton(title: StringConsts.save,)),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildFormField (context){
   final addProductController = Provider.of<AddProductController>(context);
    return Column(
      children: [
        DefaultFormField(
            labelText: StringConsts.title,
            controller:addProductController.titleTextController,
            type: TextInputType.text,
            onSubmit: (){},
            onChange: (){},
            focusNode: addProductController.titleFocusNode,
            onTap: (){},
            validate: (){},
            prefixPressed: (){},
            suffixPressed: (){}),
        SizedBox(height: SizeConsts.s10.h,),
        DefaultFormField(
            suffixText:"\$",
            labelText:  StringConsts.price,
            controller:addProductController.priceTextController,
            type: const TextInputType.numberWithOptions(),
            onSubmit: (){},
            onChange: (){},
            focusNode: addProductController.priceFocusNode,
            onTap: (){},
            validate: (){},
            prefixPressed: (){},
            suffixPressed: (){}),
        SizedBox(height: SizeConsts.s10.h,),
        DefaultFormField(
            height: SizeConsts.s100.h,
            maxLines: 7,
            labelText:  StringConsts.description,
            controller:addProductController.descriptionTextController,
            type: TextInputType.text,
            onSubmit: (){},
            onChange: (){},
            focusNode: addProductController.descriptionFocusNode,
            onTap: (){},
            validate: (){},
            prefixPressed: (){},
            suffixPressed: (){}),
        SizedBox(height: SizeConsts.s8.h,),
      ],
    );
  }

  Widget _buildDropDown(context){
    final addProductController = Provider.of<AddProductController>(context);
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
        onChanged: (val){
          addProductController.changeCategoriesValue(val);
        });
  }

}
