import 'package:cue/utils/PortUtils.dart';

void main() {
  var availablePorts = PortUtils.getUsbAvailablePort();
  if (availablePorts == null || availablePorts.length == 0) {
    return null;
  }
  for (final serialPorts in availablePorts) {
    print("Matthew: serialPorts.manufacturer = ${serialPorts.manufacturer}");
    print("Matthew: serialPorts.transport = ${serialPorts.transport}");
    print("Matthew: serialPorts.name = ${serialPorts.name}");
    print("Matthew: serialPorts.address = ${serialPorts.address}");
    print("Matthew: serialPorts.serialNumber = ${serialPorts.serialNumber}");
  }
}
