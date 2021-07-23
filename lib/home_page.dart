import 'package:cue/port_param_setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PortParamSettingPage(),
      ),
    );
  }
}
