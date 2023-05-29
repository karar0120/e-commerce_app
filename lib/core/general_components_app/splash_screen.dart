import 'dart:async';

import 'package:e_commerce/config/user_simple_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../config/route.dart';
import '../style/color_consts.dart';
import '../style/sizes_consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;

  _startOfDelay(){
    _timer=Timer(Duration(seconds:SizeConsts.s2.toInt()),_goNext);
  }
  _goNext() async{
    await UserSimplePreferences.getToken().then((value) {
    if (value==null){
      Navigator.pushReplacementNamed(context,ScreenRouter.loginScreen);
    }  else {
      Navigator.pushReplacementNamed(context,ScreenRouter.mainScreen);
    }
    });
  }

  @override
  void initState() {
    _startOfDelay();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConsts.blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(Icons.shopping_bag_outlined,
              color: ColorConsts.whiteColor,
              size: SizeConsts.s280.h,
            ),
          ),
          const SizedBox(height:SizeConsts.s20),
          SpinKitThreeBounce(color: ColorConsts.whiteColor,size: 0.08.sw,)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
