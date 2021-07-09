import 'dart:convert';

import 'package:cue/utils/PortUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

void main() {
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

void getSerialPortData(SerialPort serialPort, SerialPortConfig serialPortConfig) {
  serialPort.config = serialPortConfig;
  serialPort.openReadWrite();
  if (!serialPort.isOpen) {
    print("have not open the serial port");
    return null;
  }
  print("Serial Port of ${serialPort.name} "
      "the open status = ${serialPort.isOpen}");
  if (serialPort.isOpen) {
    var reader = SerialPortReader(serialPort);
    reader.stream.listen((dataBytes) {
      var dataStr = utf8.decode(dataBytes, allowMalformed: true);
      DateTime currentDate = DateTime.now();
      var displayLog = "[$currentDate]$dataStr";
      print(displayLog.trim());
    });
  }
}
