import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:matertino_radio/matertino_radio.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/model/model.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';

class SwitchCommunity extends StatefulWidget {
  const SwitchCommunity({super.key});

  @override
  State<SwitchCommunity> createState() => _SwitchCommunityState();
}

class _SwitchCommunityState extends State<SwitchCommunity> {
  List<Config> configList = [];
  int configId = 0;

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
        value: index,
        groupValue: configId - 1,
        title: configList[index].name!,
        tileColor: Colors.transparent,
        onChanged: (int? value) {
          configId = value! + 1;
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.switchCommunity,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                ...items
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
    for (var value in configList) {
      print(value.toJson());
    }
  }
}
