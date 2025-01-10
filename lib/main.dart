import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/pages/community/add_community.dart';
import 'package:vcare_flutter/pages/community/switch_community.dart';
import 'package:vcare_flutter/pages/nav.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';

import 'common/constants.dart';

void main() {
  runApp(const VcareApp());
}

class VcareApp extends StatelessWidget {
  const VcareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (buildContext) => VcareAppState(),
        child: const MaterialWeight());
  }
}

///主题加载
class MaterialWeight extends StatefulWidget {
  const MaterialWeight({super.key});

  @override
  State<MaterialWeight> createState() => _MaterialWeightState();
}

class _MaterialWeightState extends State<MaterialWeight> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    var state = context.read<VcareAppState>();
    await state.initState();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Center(
          child: CircularProgressIndicator(
        color: Color(defaultThemeList[0].themeColor!),
      ));
    }

    var state = context.watch<VcareAppState>();

    var colorScheme = ColorScheme.fromSeed(
      seedColor: Color(state.theme.themeColor!),
      brightness: state.config.isDark! ? Brightness.dark : Brightness.light,
    );

    var theme = ThemeData(
      splashFactory: NoSplash.splashFactory,
      useMaterial3: true,
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(color: colorScheme.primaryContainer),
    );

    Widget content = const AddCommunity();
    setState(() {
      if (state.config.id != null) {
        content = const NavPage();
      }
    });

    return MaterialApp(
        onGenerateRoute: (settings) {
          Widget route() {
            switch (settings.name!) {
              case nav:
                {
                  return const NavPage();
                }
              case communityAdd:
                {
                  return const AddCommunity();
                }
              case communitySwitch:
                {
                  return const SwitchCommunity();
                }
              default:
                {
                  return const Scaffold(body: Text("404"));
                }
            }
          }

          return PageTransition(
              child: route(), type: PageTransitionType.rightToLeft);
        },
        builder: BotToastInit(),
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: theme,
        home: content);
  }
}
