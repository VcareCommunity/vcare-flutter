import 'package:flutter/widgets.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:vcare_flutter/common/constants.dart';
import 'package:vcare_flutter/model/model.dart';
import 'package:vcare_flutter/prefs/prefs.dart';

/// App状态
class VcareAppState extends ChangeNotifier {
  Setting setting = defaultSetting;
  Theme theme = defaultThemeList[0];

  Future<void> initState() async {
    await initTheme();
    var settingId = await Prefs.getSettingId();
    if (settingId != null) {
      setting = (await Setting().getById(settingId))!;
      theme = (await setting.getTheme())!;
    }
  }

  Future<void> initTheme() async {
    //查询是否为第一次使用
    int count = await Theme().select().toCount();
    if (count == 0) {
      List dbThemeList = await Theme.saveAll(defaultThemeList);
      printList(dbThemeList);
    }
  }
}
