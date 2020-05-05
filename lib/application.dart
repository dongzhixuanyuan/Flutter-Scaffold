import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static Router router;

  static Future<SharedPreferences> sharedPreference() async {
    return await SharedPreferences.getInstance();
  }


}
