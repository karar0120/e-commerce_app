import 'package:e_commerce/core/style/color_consts.dart';
import 'package:e_commerce/products/presentation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/general_components_app/app_bar.dart';
import '../../../core/general_components_app/bottom_navigation_bar.dart';
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final changeIndexController=Provider.of<ChangeIndexController>(context);
    return Scaffold(
      appBar: GeneralAppBar(
        title:Text(changeIndexController.appBatTitle[changeIndexController.index]),
        centerTitle: true,
        leading: const SizedBox(),
        appBarColor:ColorConsts.blackColor,
      ),
      body: changeIndexController.body[changeIndexController.index],
      bottomNavigationBar: const GeneralBottomNavigationBar(),
    );
  }
}

