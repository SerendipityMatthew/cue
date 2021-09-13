import 'dart:developer' as developer;

import 'package:cue/entity/cue_serial_port.dart';
import 'package:cue/model/cue_serial_port_model.dart';
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
  List<PortLogModel> _portLogList = [];
  ValueNotifier<PortLogModel> _logValueNotifier =
      ValueNotifier<PortLogModel>(PortLogModel(DateTime.now(), "", ""));
  CueSerialPortModel _cueSerialPortModel = CueSerialPortModel(CueSerialPort());
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
                    PortParamSettingPage(
                      portDataCallBack: (portLog) {
                        developer.log("eeeeeee $portLog");
                        _logValueNotifier.value = portLog!;
                      },
                      currentSerialPortModel: _cueSerialPortModel,
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
                  child:
                      InputCommandPage(cueSerialPortModel: _cueSerialPortModel),
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
