import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstLaunch extends StatelessWidget {
  const FirstLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        return Column();
      }),
    );
  }
}
