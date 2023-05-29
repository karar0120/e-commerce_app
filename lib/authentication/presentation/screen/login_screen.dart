import 'package:e_commerce/authentication/presentation/controller/login_controller.dart';
import 'package:e_commerce/config/route.dart';
import 'package:e_commerce/core/general_components_app/app_bar.dart';
import 'package:e_commerce/core/general_components_app/form_field.dart';
import 'package:e_commerce/core/style/color_consts.dart';
import 'package:e_commerce/core/style/sizes_consts.dart';
import 'package:e_commerce/core/style/string_consts.dart';
import 'package:e_commerce/core/style/text_style_consts.dart';
import 'package:e_commerce/products/presentation/components/search_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title:const Text(StringConsts.login) ,
        appBarColor: ColorConsts.blackColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(PaddingConsts.p10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(height: SizeConsts.s150.h,),
              _buildFormFiled(context),
              _buildLoginBottom(context),
               SizedBox(height: SizeConsts.s10.h,),
              _buildRegisterBottom(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFiled(context){
    final userController=Provider.of<LoginController>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
        SizedBox(height: SizeConsts.s10.h,),
        DefaultFormField(
            maxLines: 1,
            labelText: StringConsts.password,
            controller: userController.passwordTextController,
            type: TextInputType.visiblePassword,
            onSubmit: (){},
            onChange: (){},
            focusNode: userController.passwordFocusNode,
            onTap: (){},
            validate: (){},
            prefixPressed:(){},
            obscureText: userController.isPasswordVisible ,
            suffixPressed: (){
              userController.setIsPasswordVisible();
            },
            prefixIcon: const Icon(Icons.lock),
           suffixIcon: userController.isPasswordVisible?
          const Icon(Icons.visibility_off_outlined):const Icon(Icons.visibility),
        ),
        SizedBox(height: SizeConsts.s20.h,),
      ],
    );
  }

  Widget _buildLoginBottom(context){
    final userController=Provider.of<LoginController>(context);
    return userController.isSubmittingLogin?SpinKitThreeBounce(
      color: ColorConsts.blackColor,
      size: 0.08.sw,
    ): InkWell(
        onTap: (){
          if (userController.setIsSubmitting()){
            userController.login(context);
          }
        },
        child: GeneralButton(title: StringConsts.login));
  }


  Widget _buildRegisterBottom(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringConsts.doNotHaveAnAccountYet,style: TextStyleConsts.textMedium,),
        SizedBox(width: SizeConsts.s5.w,),
        InkWell(
          onTap: (){
           Navigator.pushNamed(context, ScreenRouter.registerScreen);
          },
          child: Text(StringConsts.register,style
          :TextStyleConsts.textMedium.copyWith(decoration: TextDecoration.underline,)),
        ),
      ]
    );
  }
}
