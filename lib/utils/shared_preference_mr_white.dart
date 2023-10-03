import 'package:mr_white/utils/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceMrWhite {
  static late SharedPreferences _prefs;

  static const String _keyEnv = 'keyEnvironment';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String getEnv() =>
      _prefs.getString(_keyEnv) ?? Environment.production.name;

  static void setEnv(String env) => _prefs.setString(_keyEnv, env);
}
