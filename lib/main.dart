import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/common/constants.dart';
import 'package:vcare_flutter/state/VcareAppState.dart';

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
class MaterialWeight extends StatelessWidget {
  const MaterialWeight({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<VcareAppState>();

    var theme = ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(defaultThemeList[0].themeColor!)));

    var materialApp = MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: theme,
        home: Scaffold(
          body: Container(
            child: Text("${state.communityCount}"),
          ),
        ));

    return FutureBuilder(
        future: state.initState(),
        builder: (context, snapshot) {
          return materialApp;
        });
  }
}
