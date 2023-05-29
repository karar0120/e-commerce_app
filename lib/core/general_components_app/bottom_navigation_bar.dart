
// ignore_for_file: deprecated_member_use

import 'package:e_commerce/core/style/image_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../products/presentation/navigation_controller.dart';
import '../style/sizes_consts.dart';
import '../style/color_consts.dart';

class GeneralBottomNavigationBar extends StatelessWidget {
  const GeneralBottomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeIndexController>(
        builder: (context, changeIndexController, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(SizeConsts.s15),
                topLeft: Radius.circular(SizeConsts.s15),
              ),
              boxShadow: [
                BoxShadow(
                 color: Theme.of(context).shadowColor,
                  spreadRadius: SizeConsts.s5,
                  blurRadius: SizeConsts.s7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(SizeConsts.s15),
                topLeft: Radius.circular(SizeConsts.s15),
              ),
              child: BottomNavigationBar(
                elevation: SizeConsts.s0,
                iconSize: 0.07.sw,
                currentIndex: changeIndexController.index,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(SizeConsts.s8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: changeIndexController.index == 0
                                ? ColorConsts.whiteColor.withOpacity(0.2)
                                : Colors.transparent),
                        child: SvgPicture.asset(
                          ImageConsts.home,
                          color: Colors.white,
                          width: 0.065.sw,
                        ),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(SizeConsts.s8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: changeIndexController.index == 1
                                ? ColorConsts.whiteColor.withOpacity(0.2)
                                : Colors.transparent),
                        child: Icon(Icons.shopping_cart,
                        color: Colors.white,
                          size:0.065.sw,
                        )
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Container(
                          padding: const EdgeInsets.all(SizeConsts.s8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: changeIndexController.index == 2
                                  ? ColorConsts.whiteColor.withOpacity(0.2)
                                  : Colors.transparent),
                          child: SvgPicture.asset(
                            ImageConsts.profile,
                            color: Colors.white,
                            width: 0.065.sw,
                          )),
                      label: ""),
                ],
                onTap: (index) {
                  changeIndexController.changeIndexFunction(index);
                },
              ),
            ),
          );
        });
  }
}
