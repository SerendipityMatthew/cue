import 'dart:developer' as developer;

import 'package:cue/constants/port_param_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/cue_serial_port_model.dart';

class InputCommandPage extends StatefulWidget {
  final CueSerialPortModel cueSerialPortModel;

  const InputCommandPage({Key? key, required this.cueSerialPortModel})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InputCommandPage();
  }
}

class _InputCommandPage extends State<InputCommandPage> {
  TextEditingController _editingController = TextEditingController();
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: 950,
      height: 200,
      child: TextField(
          controller: _editingController,
          textInputAction: TextInputAction.done,
          minLines: 10,
          maxLines: 20,
          onSubmitted: (value) {
            developer.log(
                "_InputCommandPage: build: onSubmitted: inputText = $inputText");
          },
          onChanged: (value) {
            inputText = value;
            developer.log(
                "_InputCommandPage: build: onChanged: inputText = $inputText");
          },
          onEditingComplete: () {
            developer.log(
                "_InputCommandPage: build: onEditingComplete: inputText 2222 = $inputText");
            developer.log(
                "_InputCommandPage: build: onEditingComplete: inputText sSerialPortModel = ${PortParamConstant.sSerialPortModel}");
            if (PortParamConstant.sSerialPortModel != null) {
              var serialPort =
                  PortParamConstant.sSerialPortModel!.value.serialPort;
              var isSuccess = serialPort.isOpen;
              developer.log(
                  "_InputCommandPage: build: onEditingComplete: inputText isSuccess = $isSuccess");
              if (isSuccess) {
                // serialPort.write(Uint8List.fromList(inputText.codeUnits));
                // serialPort.flush(SerialPortBuffer.input);
              }
            }
          }),
    );
  }
}
