import 'package:flutter/widgets.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:vcare_flutter/common/constants.dart';
import 'package:vcare_flutter/model/model.dart';

/// App状态
class VcareAppState extends ChangeNotifier {
  int communityCount = 0;
  Setting setting = Setting(isDark: false, themeId: 1);

  Future<void> initState() async {
    await initTheme();
    communityCount = await initCommunity();
  }

  Future<int> initCommunity() async {
    //查询是否为第一次使用
    int count = await Community().select().toCount();
    return count;
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
