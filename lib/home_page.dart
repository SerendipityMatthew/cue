import 'package:cue/model/port_log_model.dart';
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
    ValueNotifier<PortLogModel> _logValueNotifier =
        ValueNotifier<PortLogModel>(PortLogModel(DateTime.now(), "", ""));
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
                        _logValueNotifier.value = portLog!;
                      },
                    ),
                    SizedBox(
                      width: 600,
                      height: 20,
                    ),
                    PortLogOutputPage(
                      logValueNotifier: _logValueNotifier,
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                  height: 20,
                ),
                Container(
                  child: InputCommandPage(),
                ),
              ],
            ),
            MostUsedCommandPage()
          ],
        ),
      ),
    );
  }
}
