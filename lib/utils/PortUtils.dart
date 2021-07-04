import 'package:flutter_libserialport/flutter_libserialport.dart';

class PortUtils {
  static List<SerialPort> getAvailablePort() {
    var availablePortList =
        List<SerialPort>.generate(20, (index) => SerialPort("Matthew"), growable: true);
    var availablePorts = SerialPort.availablePorts;
    for (final address in availablePorts) {
      availablePortList.add(SerialPort(address));
    }
    return availablePortList;
  }
}
