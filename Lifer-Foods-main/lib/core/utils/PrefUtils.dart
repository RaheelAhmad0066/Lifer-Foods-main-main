import 'package:get/get.dart';
import 'package:http/retry.dart';
import 'package:lifer_food/core/AuthControler/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  late SharedPreferences _prefsInstance;
  Future<PrefUtils> initial() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return this;
  }


  Future setBool(String key, bool? value) async {
    if (value == null) return;
    try {
      await _prefsInstance.setBool(key, value);
    } catch (e) {
      print(e);
    }
  }
  bool? getBool(String key) {
    return _prefsInstance.getBool(key);
    ;
  }

  Future setString(String key, String value) async {
    try {
      await _prefsInstance.setString(key, value);
    } catch (e) {
      print(e);
    }
  }
  String? getString(String key) {
    return _prefsInstance.getString(key);
  }
}

class Services {
  static final Services _instance = Services._();
  Services._();
  factory Services() => _instance;
  Future<void> initServices() async {
    await Get.putAsync<PrefUtils>(() => PrefUtils().initial());

  }
}
