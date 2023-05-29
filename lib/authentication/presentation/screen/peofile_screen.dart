import 'package:e_commerce/authentication/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../config/user_simple_preferences.dart';
import '../../../core/general_components_app/form_field.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/style/sizes_consts.dart';
import '../../../core/style/string_consts.dart';
import '../../../products/presentation/components/search_components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingConsts.p10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConsts.s10.h,),
            _buildFormFiled(context),
            _buildLogoutBottom(context),
            SizedBox(height: SizeConsts.s10.h,),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFiled(context){
    final userController=Provider.of<ProfileController>(context);
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

  Widget _buildLogoutBottom(context){
    final userController=Provider.of<ProfileController>(context);
    return userController.isSubmittingProfile? SpinKitThreeBounce(
      color: ColorConsts.blackColor,
      size: 0.08.sw,
    ): InkWell(
        onTap: ()async{
         // userController.addUser(context);
         userController.logOut(context);
        },
        child: GeneralButton(title: StringConsts.logout,buttonBackgroundColor: Colors.red,));
  }


}
