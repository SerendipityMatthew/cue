import 'dart:convert';
import 'dart:developer' as developer;

import 'package:cue/constants/port_param_constant.dart';
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

/// This is the stateful widget that the main application instantiates.
class PortParamSettingPage extends StatefulWidget {
  final ValueChanged<String?>? portDataCallBack;

  const PortParamSettingPage({Key? key, required this.portDataCallBack})
      : super(key: key);

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
    _portList.clear();
    _portList.add("TCP/UDP");
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
    var portOpenStatus = "Open Port";
    var cuePort = CueSerialPort.getDefaultConfigPort();
    cuePort.name = _portList[0];
    var cuePortModel = CueSerialPortModel(cuePort);
    _portList = getPortName();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              height: 40,
              width: 180,
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
              width: 260,
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _openSerialPort(cuePortModel);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryBlue)),
                      child: Text(
                        portOpenStatus,
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
                  BaudrateDropDownButton(
                    baudRateList: PortParamConstant.COMMON_BAUDRATE_LIST,
                    model: cuePortModel,
                    onDropDownTap: () {
                      _portList = getPortName();
                    },
                    onValueChanged: (portName) {
                      developer.log(
                          "cuePortModel.value.baudRate = ${cuePortModel.value.baudRate}");
                    },
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
                  ParityDropDownButton(
                    parityList: PortParamConstant.PORT_PARITY_LIST,
                    model: cuePortModel,
                    onDropDownTap: () {},
                    onValueChanged: (portName) {
                      developer.log(
                          "cuePortModel.value.parity = ${cuePortModel.value.parity}");
                    },
                  )
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
              width: 180,
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
                    width: 40,
                  ),
                  StopBitDropDownButton(
                    stopBitList: PortParamConstant.PORT_STOP_BIT_LIST,
                    portModel: cuePortModel,
                    onValueChanged: (stopBit) {},
                  ),
                  SizedBox(
                    height: 40,
                    width: 10,
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
              width: 260,
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
                  FlowTypeDropDownButton(
                    flowTypeList: PortParamConstant.PORT_FLOW_TYPE_LIST,
                    model: cuePortModel,
                    onDropDownTap: () {},
                    onValueChanged: (portName) {
                      developer.log(
                          "cuePortModel.value.flowType = ${cuePortModel.value.flowType}");
                    },
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
                    child: DataBitsDropDownButton(
                      dataBitsList: PortParamConstant.PORT_DATA_BITS_LIST,
                      model: cuePortModel,
                      onDropDownTap: () {},
                      onValueChanged: (portName) {
                        developer.log(
                            "cuePortModel.value.dataBits = ${cuePortModel.value.dataBits}");
                      },
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

  void _openSerialPort(CueSerialPortModel cuePortModel) {
    developer.log("open the port = ${cuePortModel.value.name}");
    developer.log("open the port cuePortModel = $cuePortModel");
    List<SerialPort>? allPortList = PortUtils.getUsbAvailablePort();
    for (final port in allPortList!) {
      developer.log("port.name = ${port.name}");
      if (port.name == cuePortModel.value.name) {
        developer.log("port.name 111111 = ${port.name}");
        SerialPortConfig portConfig = new SerialPortConfig();
        portConfig.baudRate = cuePortModel.value.baudRate;
        portConfig.bits = cuePortModel.value.dataBits;
        portConfig.stopBits = 1;
        portConfig.cts;
        getSerialPortData(port, portConfig);
        break;
      }
    }
  }

  void getSerialPortData(
      SerialPort serialPort, SerialPortConfig serialPortConfig) {
    serialPort.close();
    var isSuccess = serialPort.open(mode: SerialPortMode.readWrite);
    try {
      serialPort.config = serialPortConfig;
    } on Exception {
      SnackBar snackBar = SnackBar(content: Text("打开端口号失败"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

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
      var displayLog = "[$currentDate]$dataStr\n";
      this.widget.portDataCallBack!(displayLog);
      developer.log("${displayLog.trim()}");
    });
  }
}
