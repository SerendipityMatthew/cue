import 'package:cue/port_log_output_page.dart';
import 'package:cue/port_param_setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_command_page.dart';

/// This is the main application widget.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cue'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                PortParamSettingPage(),
                PortLogOutputPage(),
              ],
            ),
            InputCommandPage(),
          ],
        ),
      ),
    );
  }
}
