import 'dart:convert';
import 'dart:developer' as developer;

import 'package:cue/entity/cue_serial_port.dart';
import 'package:cue/model/cue_serial_port_model.dart';
import 'package:cue/utils/PortUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

import 'BaudrateDropDownButton.dart';
import 'DataBitsDropDownButton.dart';
import 'FlowTypeDropDownButton.dart';
import 'ParityDropDownButton.dart';
import 'PortListDropDownButton.dart';
import 'StopBitDropDownButton.dart';
import 'colors/AppColors.dart';
import 'main.dart';

/// This is the stateful widget that the main application instantiates.
class PortParamSettingPage extends StatefulWidget {
  const PortParamSettingPage({Key? key}) : super(key: key);

  @override
  State<PortParamSettingPage> createState() => _PortParamSettingPage();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PortParamSettingPage extends State<PortParamSettingPage> {
  List<String> _portList = [
    "TCP/UDP",
  ];

  List<String> getPortName() {
    List<SerialPort> serialPortList = PortUtils.getAllAvailablePort();
    for (final serialPort in serialPortList) {
      var portName = serialPort.name;
      if (portName != null) {
        if (!_portList.contains(portName)) {
          _portList.add(portName);
        }
      }
    }
    return _portList;
  }

  @override
  Widget build(BuildContext context) {
    var cuePortModel = CueSerialPortModel(CueSerialPort()..name = _portList[0]);
    _portList = getPortName();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      "Listen Port",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      "Hex 显示",
                      style: TextStyle(color: AppColors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 352,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        developer
                            .log("open the port = ${cuePortModel.value.name}");
                        List<SerialPort>? allPortList =
                            PortUtils.getUsbAvailablePort();
                        for (final port in allPortList!) {
                          developer.log("port.name = ${port.name}");
                          if (port.name == cuePortModel.value.name) {
                            developer.log("port.name 111111 = ${port.name}");
                            SerialPortConfig portConfig =
                                new SerialPortConfig();
                            portConfig.baudRate = 2000000;
                            portConfig.bits = 8;
                            portConfig.stopBits = 1;
                            getSerialPortData(port, portConfig);
                            break;
                          }
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryBlue)),
                      child: Text(
                        "Open Port",
                        style: TextStyle(color: AppColors.white),
                      )),
                  SizedBox(
                    height: 40,
                    width: 10,
                  ),
                  PortListDropDownButton(
                    portList: _portList,
                    model: cuePortModel,
                    onDropDownTap: () {
                      _portList = getPortName();
                    },
                    onValueChanged: (portName) {
                      developer.log(
                          "cuePortModel.value.name = ${cuePortModel.value.name}");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryBlue)),
                      child: Text(
                        'Baudrate',
                        style: TextStyle(color: AppColors.white),
                      )),
                  SizedBox(
                    width: 30,
                    height: 40,
                  ),
                  BaudrateDropDownButton()
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryBlue)),
                      child: Text(
                        'Parity',
                        style: TextStyle(color: AppColors.white),
                      )),
                  SizedBox(
                    width: 70,
                    height: 40,
                  ),
                  ParityDropDownButton()
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
          width: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryBlue)),
                      child: Text(
                        'Stop Bits',
                        style: TextStyle(color: AppColors.white),
                      )),
                  SizedBox(
                    height: 40,
                    width: 80,
                  ),
                  StopBitDropDownButton()
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryBlue)),
                      child: Text(
                        'Flow Type',
                        style: TextStyle(color: AppColors.white),
                      )),
                  SizedBox(
                    height: 40,
                    width: 10,
                  ),
                  FlowTypeDropDownButton()
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  Container(
                    width: 110,
                    child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryBlue)),
                        child: Text(
                          'Data Bits',
                          style: TextStyle(color: AppColors.white),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                    width: 50,
                  ),
                  Container(
                    width: 40,
                    child: DataBitsDropDownButton(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  Container(
                    width: 110,
                    child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryBlue)),
                        child: Text(
                          '保存log',
                          style: TextStyle(color: AppColors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

void getSerialPortData(
    SerialPort serialPort, SerialPortConfig serialPortConfig) {
  serialPort.close();
  var isSuccess = serialPort.open(mode: SerialPortMode.readWrite);
  serialPort.config = serialPortConfig;

  if (!serialPort.isOpen) {
    developer.log("we have not open the serial port of ${serialPort.name}",
        name: "getSerialPortData");
    return null;
  }
  developer.log(
      "Serial Port of ${serialPort.name} the open status = ${serialPort.isOpen} ",
      name: "getSerialPortData");
  var reader = SerialPortReader(serialPort);
  reader.stream.listen((dataBytes) {
    var dataStr = utf8.decode(dataBytes, allowMalformed: true);
    DateTime currentDate = DateTime.now();
    var displayLog = "[$currentDate]$dataStr";
    developer.log("${displayLog.trim()}", name: "getSerialPortData");
  });
}
