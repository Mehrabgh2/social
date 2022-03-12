import 'package:objectbox/objectbox.dart';

@Entity()
class SettingModel {
  int id;
  String theme;
  String locale;
  String token;
  int tokenExpire;

  SettingModel(
      {this.id = 0,
      required this.theme,
      required this.locale,
      required this.token,
      required this.tokenExpire});
}
