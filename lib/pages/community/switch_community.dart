import 'package:bot_toast/bot_toast.dart';
import 'package:easy_avatar/easy_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:matertino_radio/matertino_radio.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/model/model.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';

import '../../common/constants.dart';

class SwitchCommunity extends StatefulWidget {
  const SwitchCommunity({super.key});

  @override
  State<SwitchCommunity> createState() => _SwitchCommunityState();
}

class _SwitchCommunityState extends State<SwitchCommunity> {
  List<Config> configList = [];
  int? configId;

  @override
  void initState() {
    getConfigList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<VcareAppState>();
    List<Widget> items = List.generate(configList.length, (index) {
      return MatertinoRadioListTile(
        value: configList[index].id,
        groupValue: configId,
        title: configList[index].name!,
        tileColor: Colors.transparent,
        //todo avatar
        trailingWidget: const Avatar(
          size: 35,
          margin: EdgeInsets.all(5),
          textMode: true,
          text: "菜籽",
        ),
        onChanged: (value) {
          setState(() {
            configId = value!;
          });
        },
      );
    });

    Widget btn = Row(
      children: [
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, communityAdd);
                },
                child: Text(AppLocalizations.of(context)!.newCommunity),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  if (configId == null) {
                    BotToast.showText(
                        text:
                            AppLocalizations.of(context)!.notSelectedCommunity);
                    return;
                  }
                  await appState.changeConfigById(configId);
                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, nav);
                  }
                },
                child: Text(AppLocalizations.of(context)!.joinCommunity),
              ),
            )),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          AppLocalizations.of(context)!.switchCommunity,
        ),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, maxHeight: 350),
            width: constraint.maxWidth * 0.75,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...items,
                const SizedBox(
                  height: 15,
                ),
                btn,
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<void> getConfigList() async {
    var list = await Config().select().toList();
    setState(() {
      configList = list;
    });
  }
}
