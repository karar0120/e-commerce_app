import 'package:e_commerce/core/style/sizes_consts.dart';
import 'package:flutter/material.dart';

ThemeData themeData =ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      // selectedItemColor: ColorConsts.greenBlue,
      unselectedItemColor: Colors.grey,
      elevation: SizeConsts.s20,
      backgroundColor:Color(0xFF181818),
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize:  FontSizeConsts.s12,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: TextStyle(
        //fontFamily:FontConstants.fontFamilyBold,
        color: Colors.white,
        fontSize:  FontSizeConsts.s12,
        fontWeight: FontWeight.w400,
      ),

    )
);