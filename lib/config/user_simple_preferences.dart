import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences{
  static late SharedPreferences _preferences;

  static const _keyToken='token';

  static const _keyUserId='UserId';


  Future init() async {
    return _preferences=await SharedPreferences.getInstance();
  }

  static Future setToken(String token)async{
    _preferences.setString(_keyToken, token);
  }


  static Future getToken()async{
    _preferences.getString(_keyToken);
  }

  static Future setUseID(int id)async{
    _preferences.setInt(_keyUserId, id);
  }

  static Future getUseID()async{
    _preferences.getInt(_keyUserId);
  }

  static Future logOut()async{
    _preferences.clear();
  }


}