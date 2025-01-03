import 'package:easy_avatar/easy_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/common/constants.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';

import '../prefs/prefs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<VcareAppState>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.all(5),
            child: const _Avatar(size: 45),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: _DrawerHeader(),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.exitCommunity),
              trailing: const Icon(Icons.exit_to_app),
              onTap: () async {
                await logout(context);
              },
            ),
            // Add more list tiles if you need
          ],
        ),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Text('Open Drawer'),
          );
        }),
      ),
    );
  }

  logout(BuildContext context) async {
    var state = Provider.of<VcareAppState>(context, listen: false);
    var config = state.config;
    await config.delete();
    await Prefs.deleteConfig();
    var count = await config.select().toCount();
    if (count > 0) {
    } else {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, "/community/add");
      }
    }
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = context.watch<VcareAppState>();
    return Row(
      children: [
        Avatar(
          size: 75,
          textMode: true,
          text: state.config.name!,
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        Expanded(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.config.name!,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final double size;

  const _Avatar({required this.size});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Avatar(
          size: size,
          margin: const EdgeInsets.all(5),
          // textMode: true,
          // text: "菜籽",
          image: defaultAvatar,
        ),
      ),
    );
  }
}
