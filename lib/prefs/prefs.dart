import 'package:shared_preferences/shared_preferences.dart';

const _settingIdKey = 'settingId';

class Prefs {
  static Future<void> setSettingId(int settingId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_settingIdKey, settingId);
  }

  static Future<int?> getSettingId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_settingIdKey);
  }
}
