import 'dart:convert';
import 'dart:developer' as developer;

import 'package:cue/home_page.dart';
import 'package:cue/utils/PortUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

void getAll() {
  var availablePorts = PortUtils.getUsbAvailablePort();
  if (availablePorts == null || availablePorts.length == 0) {
    return null;
  }
  for (final serialPort in availablePorts) {
    print("Matthew: serialPort.manufacturer = ${serialPort.manufacturer}");
    print("Matthew: serialPort.transport = ${serialPort.transport}");
    print("Matthew: serialPort.name = ${serialPort.name}");
    print("Matthew: serialPort.address = ${serialPort.address}");
    print("Matthew: serialPort.serialNumber = ${serialPort.serialNumber}");
  }
  var serialPort1 = availablePorts.first;

  SerialPortConfig portConfig = new SerialPortConfig();
  portConfig.baudRate = 115200;
  portConfig.stopBits = 1;
  portConfig.bits = 8;

  getSerialPortData(serialPort1, portConfig);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<MyApp> {
  Color _primaryColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Cue Application",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: _primaryColor,
        accentColor: _primaryColor,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', ''),
      ],
      darkTheme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

void getSerialPortData(
    SerialPort serialPort, SerialPortConfig serialPortConfig) {
  serialPort.config = serialPortConfig;
  var isSuccess = serialPort.open(mode: SerialPortMode.readWrite);

  if (!serialPort.isOpen) {
    developer.log("we have not open the serial port of ${serialPort.name}",
        name: "getSerialPortData");
    return null;
  }
  developer.log(
      "Serial Port of ${serialPort.name} the open status = ${serialPort.isOpen} ",
      name: "getSerialPortData");
  if (serialPort.isOpen) {
    var reader = SerialPortReader(serialPort);
    reader.stream.listen((dataBytes) {
      var dataStr = utf8.decode(dataBytes, allowMalformed: true);
      DateTime currentDate = DateTime.now();
      var displayLog = "[$currentDate]$dataStr";
      developer.log("${displayLog.trim()}", name: "getSerialPortData");
    });
  }
}
