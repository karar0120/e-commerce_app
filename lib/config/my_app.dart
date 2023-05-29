import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce/authentication/presentation/controller/login_controller.dart';
import 'package:e_commerce/authentication/presentation/controller/profile_controller.dart';
import 'package:e_commerce/authentication/presentation/controller/register_controller.dart';

import 'package:e_commerce/cart/presentation/controller/cart_controller.dart';
import 'package:e_commerce/config/route.dart';
import 'package:e_commerce/config/them.dart';
import 'package:e_commerce/core/style/string_consts.dart';
import 'package:e_commerce/products/presentation/components/image.dart';
import 'package:e_commerce/products/presentation/controller/add_product.dart';
import 'package:e_commerce/products/presentation/controller/delete_product.dart';
import 'package:e_commerce/products/presentation/controller/edit_product.dart';
import 'package:e_commerce/products/presentation/controller/product_controller.dart';

import 'package:e_commerce/products/presentation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:(context,child){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: ChangeIndexController(),
              ),
              ChangeNotifierProvider.value(
                value: ProductController()..getProduct()..getCategories(),
              ),
              ChangeNotifierProvider.value(
                value: ImagePickerController(),
              ),
              ChangeNotifierProvider.value(
                value: CartController()..getCart(),
              ),
              ChangeNotifierProvider.value(
                value: RegisterController(),
              ),
              ChangeNotifierProvider.value(
                  value: LoginController()
              ),
              ChangeNotifierProvider.value(
                value: ProfileController()..profile(context),
              ),
              ChangeNotifierProvider.value(
                value: DeleteProductController(),
              ),
              ChangeNotifierProvider.value(
                value: AddProductController(),
              ),
              ChangeNotifierProvider.value(
                  value: EditProductController()
              ),
            ],
            child: MaterialApp(
                navigatorObservers: [BotToastNavigatorObserver()],
                debugShowCheckedModeBanner: false,
                title: StringConsts.ecommerce,
                builder: BotToastInit(),
                theme: themeData,
                onGenerateRoute: AppRouter.generateRoute,
            ),
          );
        }
    );
  }
}