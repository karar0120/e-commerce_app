// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../style/sizes_consts.dart';
import '../style/color_consts.dart';

class GeneralAppBar extends StatelessWidget with PreferredSizeWidget {
  Widget? title;
  double? leadingWidth;
  bool? centerTitle;
  double?padding = SizeConsts.s0;
  Color? appBarColor;
  Widget? leading;
  List<Widget>? actions;
  double? elevation =  SizeConsts.s0;
  double? appbarPreferredSize;
  Color? appbarBackButtonColor;
  @override
  GeneralAppBar({Key? key,
    this.title,
    this.leadingWidth,
    this.centerTitle,
    this.appBarColor,
    this.leading,
    this.actions,
    this.appbarPreferredSize = SizeConsts.s80,
    this.elevation,
    this.padding = SizeConsts.s0,
    this.appbarBackButtonColor = ColorConsts.whiteColor
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: leadingWidth,
        backgroundColor: appBarColor,
        centerTitle: centerTitle ?? false,
        title: title,
        elevation: elevation,
        leading: leading ??
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: appbarBackButtonColor,
                  size: SizeConsts.s18,
                )),
        actions: actions,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(SizeConsts.s25),
          ),
        ),
      ),
    );
  }
  @override
  Size get preferredSize =>
      Size.fromHeight(appbarPreferredSize ?? kToolbarHeight);
}
