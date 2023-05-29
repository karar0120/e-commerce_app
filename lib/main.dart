import 'package:flutter/material.dart';
import 'config/my_app.dart';
import 'config/user_simple_preferences.dart';
import 'core/utils/service_locator/service.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

    ServiceLocator().init();
   await UserSimplePreferences().init();
   runApp(const MyApp());
}


