import 'package:e_commerce/config/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../core/general_components_app/app_bar.dart';
import '../../../core/general_components_app/form_field.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/style/sizes_consts.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/style/text_style_consts.dart';
import '../../../products/presentation/components/search_components.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title:const Text(StringConsts.register) ,
        appBarColor: ColorConsts.blackColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PaddingConsts.p10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormFiled(context),
              _buildRegisterBottom(context),
              SizedBox(height: SizeConsts.s10.h,),
              _buildLoginBottom(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFiled(context){
    final userController=Provider.of<RegisterController>(context);
    return Column(
      children: [
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.firstName,
          controller:userController.firstNameTextController ,
          type: TextInputType.emailAddress,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.firstFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed: (){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.person),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.lastName,
          controller:userController.lastNameTextController ,
          type: TextInputType.emailAddress,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.lastNameFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed: (){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.person),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.userName,
          controller:userController.userNameTextController ,
          type: TextInputType.emailAddress,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.userNameFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed: (){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.person),
        ),
        SizedBox(height: SizeConsts.s5.w,),
        DefaultFormField(
          labelText: StringConsts.email,
          controller:userController.emailTextController ,
          type: TextInputType.emailAddress,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.emailFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed: (){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.email),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.phone,
          controller: userController.phoneTextController,
          type: TextInputType.phone,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.phoneFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed:(){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.phone),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.password,
          controller: userController.passwordTextController,
          type: TextInputType.visiblePassword,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.passwordFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed:(){},
          suffixPressed: (){
            userController.setIsPasswordVisible();
          },
          maxLines: 1,
          obscureText:userController.isPasswordVisible,
          suffixIcon:userController.isPasswordVisible?const Icon(Icons.visibility_off_outlined):const Icon(Icons.visibility),
          prefixIcon: const Icon(Icons.lock),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.city,
          controller: userController.cityTextController,
          type: TextInputType.text,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.cityFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed:(){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.location_city),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.street,
          controller: userController.streetTextController,
          type: TextInputType.text,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.streetFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed:(){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.location_city),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.number,
          controller: userController.numberTextController,
          type: TextInputType.number,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.numberFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed:(){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.location_city),
        ),
        SizedBox(height: SizeConsts.s5.h,),
        DefaultFormField(
          labelText: StringConsts.zipCode,
          controller: userController.zipCodeTextController,
          type: TextInputType.text,
          onSubmit: (){},
          onChange: (){},
          focusNode: userController.zipCodeFocusNode,
          onTap: (){},
          validate: (){},
          prefixPressed:(){},
          suffixPressed: (){},
          prefixIcon: const Icon(Icons.cabin_rounded),
        ),
        SizedBox(height: SizeConsts.s20.h,),
      ],
    );
  }

  Widget _buildRegisterBottom(context){
    final userController=Provider.of<RegisterController>(context);
    return userController.isSubmittingAddUser? SpinKitThreeBounce(
      color: ColorConsts.blackColor,
      size: 0.08.sw,
    ): InkWell(
        onTap: (){
          if (userController.setIsSubmitting()){
            userController.addUser(context);
          }
        },
        child: GeneralButton(title: StringConsts.register));
  }


  Widget _buildLoginBottom(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(StringConsts.areYouHaveAnAccount,style: TextStyleConsts.textMedium,),
          SizedBox(width: SizeConsts.s5.w,),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,ScreenRouter.loginScreen);
            },
            child: Text(StringConsts.login,style
                :TextStyleConsts.textMedium.copyWith(decoration: TextDecoration.underline,)),
          ),
        ]
    );
  }
}
