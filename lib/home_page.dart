import 'package:cue/most_used_command.dart';
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
        body: Row(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    PortParamSettingPage(),
                    SizedBox(
                      width: 600,
                      height: 20,
                    ),
                    PortLogOutputPage(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InputCommandPage(),
              ],
            ),
            MostUsedCommandPage()
          ],
        ),
      ),
    );
  }
}
