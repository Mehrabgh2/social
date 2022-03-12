import 'package:social/db/SettingsModel.dart';
import 'package:social/objectbox.g.dart';

class DBProvider {
  static final DBProvider _instance = DBProvider._internal();
  static const THEME_SETTING = 0;
  static const LOCALE_SETTING = 1;
  static const TOKEN_SETTING = 2;

  static late Store _store;
  static late Box _box;

  factory DBProvider() {
    return _instance;
  }

  DBProvider._internal() {
    _store = Store(getObjectBoxModel(),
        directory: '/data/user/0/com.example.social/app_flutter/objectbox');
    _box = _store.box<SettingModel>();
  }

  void dispose() {
    _store.close();
  }

  void updateSetting(int setting, String? newSetting) {
    if (newSetting != null) {
      SettingModel model = _box.get(1);
      switch (setting) {
        case THEME_SETTING:
          model.theme = newSetting;
          break;
        case LOCALE_SETTING:
          model.locale = newSetting;
          break;
        case TOKEN_SETTING:
          model.token = newSetting;
          break;
        default:
          break;
      }
      _box.put(model);
    }
  }

  void updateTokenExpire(int? newExpire) {
    if (newExpire != null) {
      print(newExpire);
      SettingModel model = _box.get(1);
      model.tokenExpire = newExpire;
      _box.put(model);
    }
  }

  void checkBoxCount() {
    if (_box.getAll().length == 0) {
      _box.put(SettingModel(theme: "", locale: "", token: "", tokenExpire: 0));
    }
  }

  SettingModel getSettings() {
    checkBoxCount();
    SettingModel s = _box.get(1) as SettingModel;
    if (s != null) return s;
    return SettingModel(theme: "", locale: "", token: "", tokenExpire: 0);
  }

  int getTokenSize() {
    return _box.getAll().length;
  }
}
