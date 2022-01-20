import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceService {

  static const localeKey = "app_local";

  static void setLocale(String value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(localeKey, value);
  }

  static Future<String> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(localeKey) ?? 'en';
  }

}