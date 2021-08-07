import 'package:cue/most_used_command.dart';
import 'package:cue/port_log_output_page.dart';
import 'package:cue/port_param_setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_command_page.dart';

/// This is the main application widget.
class HomePage extends StatelessWidget {
  String _portLog = "";

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> logValueNotifier = ValueNotifier<String>('');
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    PortParamSettingPage(
                      portDataCallBack: (portLog) {
                        logValueNotifier.value += portLog!;
                      },
                    ),
                    SizedBox(
                      width: 600,
                      height: 20,
                    ),
                    PortLogOutputPage(
                      logValueNotifier: logValueNotifier,
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
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
