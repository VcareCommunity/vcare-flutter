import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:vcare_flutter/common/constants.dart';
import 'package:vcare_flutter/model/model.dart';
import 'package:vcare_flutter/prefs/prefs.dart';

/// App状态
class VcareAppState extends ChangeNotifier {
  final logger = Logger("VcareAppState");
  Config config = defaultConfig;
  AppTheme theme = defaultThemeList[0];

  Future<void> changeConfig(Config config) async {
    this.config = config;
    notifyListeners();
  }

  Future<void> changeConfigById(int? configId) async {
    if (configId != null) {
      config = (await config.select().id.equals(configId).toSingle())!;
      theme = (await config.getAppTheme())!;
      await Prefs.setConfigId(configId);
    } else {
      config = defaultConfig;
      theme = defaultThemeList[0];
    }
    notifyListeners();
  }

  Future<void> changeThemeById(int themeId) async {
    theme = (await theme.getById(themeId))!;
    config.appThemeId = themeId;
    notifyListeners();
  }

  Future<void> changeDarkMode(bool isDark) async {
    config.isDark = isDark;
    notifyListeners();
  }

  Future<void> initState() async {
    await initTheme();
    var configId = await Prefs.getConfigId();
    if (configId != null) {
      config = (await config.getById(configId))!;
      theme = (await config.getAppTheme())!;
    }
    notifyListeners();
  }

  Future<void> initTheme() async {
    int count = await AppTheme().select().toCount();
    if (count == 0) {
      logger.info("首次加载APP");
      var list = await AppTheme.saveAll(defaultThemeList);
      logger.config("保存主题配置信息:$list");
    }
  }
}
