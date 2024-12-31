import 'package:easy_avatar/easy_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';

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
    var config = state.config;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Avatar(),
          ],
        ),
        // leading: _Leading(),
        // title: Text(config.name!),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
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
}

class _Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Avatar(
          size: 45,
          margin: EdgeInsets.all(5),
          textMode: true,
          text: "菜籽",
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
