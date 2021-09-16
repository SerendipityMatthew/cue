import 'package:cue/model/cue_serial_port_model.dart';

class PortParamConstant {
  static const List<String> COMMON_BAUDRATE_LIST = [
    "9,600",
    "19,200",
    "38,400",
    "57,600",
    "115,200",
    "2,000,000"
  ];
  static const List<String> PORT_PARITY_LIST = [
    "none",
    'even',
    'odd',
    'mark',
    'space'
  ];
  static const List<int> PORT_DATA_BITS_LIST = [
    5,
    6,
    7,
    8,
  ];
  static const List<String> PORT_FLOW_TYPE_LIST = [
    'none',
    'RTS',
    'CTS',
    'XON',
    'XOFF'
  ];
  static const List<String> PORT_STOP_BIT_LIST = ["1", "2"];

  static CueSerialPortModel? sSerialPortModel;
}
