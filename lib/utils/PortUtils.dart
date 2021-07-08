import 'dart:io';

import 'package:flutter_libserialport/flutter_libserialport.dart';

class PortUtils {
  static List<SerialPort> getAllAvailablePort() {
    var availablePortList = List<SerialPort>.generate(
        0, (index) => SerialPort("Matthew"),
        growable: true);
    var availablePorts = SerialPort.availablePorts;
    for (final address in availablePorts) {
      availablePortList.add(SerialPort(address));
    }
    return availablePortList;
  }

  static List<SerialPort>? getUsbAvailablePort() {
    if (Platform.isMacOS) {
      var availablePortList = getAllAvailablePort();
      var usbPortList = List<SerialPort>.generate(0, (index) => SerialPort("Matthew"));
      availablePortList.forEach((port) {
        if (port.name!.contains("USB")) {
          usbPortList.add(port);
        }
      });
      return usbPortList;
    }
  }
}
