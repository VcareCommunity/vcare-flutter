import 'package:bot_toast/bot_toast.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:matertino_radio/matertino_radio.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/api/config_service.dart';
import 'package:vcare_flutter/common/constants.dart';
import 'package:vcare_flutter/component/text_field.dart';
import 'package:vcare_flutter/model/model.dart';
import 'package:vcare_flutter/prefs/prefs.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';
import 'package:vcare_flutter/tools/regexp.dart';

class AddCommunity extends StatefulWidget {
  const AddCommunity({
    super.key,
  });

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  late VcareAppState appState;
  String communityUrl = "https://natane.top/api";
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    appState = Provider.of<VcareAppState>(context, listen: false);
  }

  _getCommunityToast() {
    if (context.mounted) {
      BotToast.showText(
        text: AppLocalizations.of(context)!.cannotCommunity,
      );
    }
  }

  _communityExistToast() {
    if (context.mounted) {
      BotToast.showText(
        text: AppLocalizations.of(context)!.communityExists,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = context.watch<VcareAppState>();

    Widget input = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Input(
          labelText: AppLocalizations.of(context)!.communityUrl,
          hintText: AppLocalizations.of(context)!.communityUrlPlaceholder,
          suffixIcon: Icon(
            Icons.message,
            color: Theme.of(context).colorScheme.primary,
          ),
          initialValue: communityUrl,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppLocalizations.of(context)!.communityUrlPlaceholder;
            }
            if (!internetURL.hasMatch(value)) {
              return AppLocalizations.of(context)!.regexpInternetUrl;
            }
            return null;
          },
          onChanged: (value) {
            communityUrl = value!;
          },
        )
      ],
    );

    button(BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //提交按钮部分
            LayoutBuilder(builder: (context, constraint) {
              return Container(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                width: constraint.maxWidth * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          var configInfo = await getConfigInfo(communityUrl);
                          if (await checkConfig(configInfo) &&
                              context.mounted) {
                            var state = Provider.of<VcareAppState>(context,
                                listen: false);
                            var config = Config(
                              baseUrl: communityUrl,
                              name: configInfo!.community,
                              version: configInfo.version,
                            );
                            state.changeConfig(config);
                            if (context.mounted) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const ThemeConfig(),
                                      type: PageTransitionType.rightToLeft));
                            }
                          }
                        }
                      },
                      child: Text(AppLocalizations.of(context)!.nextStep),
                    ),
                  ],
                ),
              );
            }),
          ],
        );

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.joinCommunity),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: KeyboardAvoider(
          child: Form(
            key: _formKey,
            child: Center(
              child: LayoutBuilder(builder: (context, constraint) {
                return Container(
                    constraints:
                        const BoxConstraints(maxWidth: 500, maxHeight: 350),
                    width: constraint.maxWidth * 0.75,
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SafeArea(child: input),
                        const SizedBox(
                          height: 40,
                        ),
                        button(context)
                      ],
                    ));
              }),
            ),
          ),
        ));
  }

  Future<ConfigResp?> getConfigInfo(String communityUrl) async {
    var chopper = ChopperClient(
        baseUrl: Uri.parse(communityUrl),
        services: [ConfigService.create()],
        converter: const JsonConverter(),
        errorConverter: const JsonConverter());
    var configService = chopper.getService<ConfigService>();
    Response<Map<String, dynamic>> configResp;
    try {
      configResp = await configService.getVcareConfig();
    } catch (e) {
      chopperLogger.severe("request error", e);
      return null;
    }
    if (configResp.statusCode == 200 &&
        configResp.body != null &&
        configResp.body!.isNotEmpty) {
      return ConfigResp.fromJson(configResp.body!["data"]);
    }
    return null;
  }

  Future<bool> checkConfig(ConfigResp? config) async {
    if (config != null) {
      Config? dbConfig = await Config()
          .select()
          .baseUrl
          .equals(communityUrl)
          .top(1)
          .toSingle();
      if (dbConfig != null) {
        _communityExistToast();
        return false;
      }
    } else {
      _getCommunityToast();
      return false;
    }
    return true;
  }
}

class ThemeConfig extends StatefulWidget {
  const ThemeConfig({super.key});

  @override
  State<ThemeConfig> createState() => _ThemeConfigState();
}

class _ThemeConfigState extends State<ThemeConfig> {
  bool darkMode = false;
  int themeId = 1;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<VcareAppState>();

    Widget isDarkWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.darkMode,
          style: const TextStyle(fontSize: 16),
        ),
        Switch(
            value: darkMode,
            onChanged: (value) async {
              darkMode = value;
              await state.changeDarkMode(value);
            })
      ],
    );
    Widget themeWidget = Column(
      children: [
        Row(
          children: [
            Text(
              AppLocalizations.of(context)!.themeColor,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(defaultThemeList.length, (index) {
              return MatertinoRadioListTile(
                value: index,
                groupValue: themeId - 1,
                title: defaultThemeList[index].name!,
                trailingWidget: Container(
                    width: 30,
                    height: 15,
                    color: Color(defaultThemeList[index].themeColor!)),
                onChanged: (value) async {
                  themeId = value! + 1;
                  await state.changeThemeById(themeId);
                },
                tileColor: Colors.transparent,
              );
            })),
      ],
    );

    Widget saveBtn =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(
        height: 5,
      ),
      //提交按钮部分
      LayoutBuilder(builder: (context, constraint) {
        return Container(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            width: constraint.maxWidth * 0.5,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () async {
                    await state.config.save();
                    await Prefs.setConfigId(state.config.id!);
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, nav);
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.completed))
            ]));
      })
    ]);

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.themeSettings),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: KeyboardAvoider(
          child: LayoutBuilder(builder: (context, constraint) {
            return Center(
              child: Container(
                constraints:
                    const BoxConstraints(maxWidth: 500, maxHeight: 350),
                width: constraint.maxWidth * 0.75,
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isDarkWidget,
                    const Divider(),
                    themeWidget,
                    const Divider(),
                    saveBtn,
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
