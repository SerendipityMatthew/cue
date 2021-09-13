import 'package:cue/constants/port_param_constant.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class CueSerialPort {
  /// 这个配置的项目的名称
  late String projectName;

  /// 端口号的名称, 这个名称和系统当中的显示是一样的
  late String name;

  /// 这个配置的别名,
  late String alias;

  /// 波特率
  late int baudRate;
  late String flowType;
  late String stopBits;
  late String parity;

  late int dataBits;
  late SerialPort serialPort;

  static CueSerialPort getDefaultConfigPort() {
    var cuePort = CueSerialPort();
    cuePort.baudRate = int.parse(
        PortParamConstant.COMMON_BAUDRATE_LIST.first.replaceAll(",", ""));
    cuePort.parity = PortParamConstant.PORT_PARITY_LIST.first;
    cuePort.dataBits = PortParamConstant.PORT_DATA_BITS_LIST.last;
    cuePort.flowType = PortParamConstant.PORT_FLOW_TYPE_LIST.first;
    cuePort.stopBits = PortParamConstant.PORT_STOP_BIT_LIST.first;
    return cuePort;
  }
}
