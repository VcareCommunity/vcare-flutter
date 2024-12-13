import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcare_flutter/state/vcare_app_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<VcareAppState>();

    return Scaffold(
        body: Text("config: ${state.config.toJson()}"
            "theme:${state.theme.toJson()}"));
  }
}
