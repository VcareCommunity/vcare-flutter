import 'package:easy_avatar/easy_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/intl_localizations.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/common/constants.dart';
import 'package:vcare_flutter/pages/nav/home.dart';
import 'package:vcare_flutter/pages/nav/mine.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int navigationBarIndex = 0;

  @override
  Widget build(BuildContext context) {
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
      drawer: _Drawer(),
      body: Builder(builder: (context) {
        if (navigationBarIndex == 0) {
          return Home();
        } else {
          return Mine();
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationBarIndex,
        enableFeedback: false,
        selectedIconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.primary),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                navigationBarIndex == 0 ? Icons.home : Icons.home_outlined),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
                navigationBarIndex == 1 ? Icons.person : Icons.person_outline),
            label: AppLocalizations.of(context)!.mine,
          ),
        ],
        onTap: (index) {
          navigationBarIndex = index;
          setState(() {});
        },
      ),
    );
  }
}

class _Drawer extends StatefulWidget {
  @override
  State<_Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<_Drawer> {
  late VcareAppState appState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appState = Provider.of<VcareAppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: _DrawerHeader(),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.switchCommunity),
            trailing: const Icon(Icons.sync_alt),
            onTap: () async {
              await switchCommunity(context);
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.exitCommunity),
            trailing: const Icon(Icons.exit_to_app),
            onTap: () async {
              await logoutCommunity(context);
            },
          ),
          // Add more list tiles if you need
        ],
      ),
    );
  }

  logoutCommunity(BuildContext context) async {
    var config = appState.config;
    await appState.removeCurrentConfig();

    var count = await config.select().toCount();
    if (count > 0) {
    } else {
      if (context.mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(communityAdd, (route) => false);
      }
    }
  }

  switchCommunity(BuildContext context) async {
    Navigator.of(context).pushNamed(communitySwitch);
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
