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
  var serialPort = availablePorts.first;
  if (serialPort.name == "/dev/cu.SLAB_USBtoUART") {
    serialPort.open(mode: SerialPortMode.readWrite);
    SerialPortConfig portConfig = new SerialPortConfig();
    portConfig.baudRate = 115200;
    portConfig.stopBits = 1;
    portConfig.bits = 8;
    serialPort.config = portConfig;
    if (!serialPort.isOpen) {
      print("have not open the serial port");
    }
    print("serialPort.isOpen 333 = ${serialPort.isOpen}");
    if (serialPort.isOpen) {
      var logList = serialPort;
      print("$logList");
    }
  }
}
