import 'package:vcare_flutter/model/model.dart';

const device = "mobile";

final List<AppTheme> defaultThemeList = [
  AppTheme(name: "晴蓝", themeColor: 0xff5698c3),
  AppTheme(name: "艳红", themeColor: 0xffed5a65),
  AppTheme(name: "寇梢绿", themeColor: 0xff5dbe8a),
  AppTheme(name: "桔梗紫", themeColor: 0xff813c85)
];

final Config defaultConfig = Config(isDark: false, appThemeId: 1);

const String appName="Vcare";
const String defaultAvatar = "assets/images/default_avatar.jpg";


const String nav = "/nav";
const String communityAdd = "/community/add";
const String communitySwitch = "/community/switch";
