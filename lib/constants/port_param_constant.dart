class PortParamConstant {
  static const List<int> COMMON_BAUDRATE_LIST = [
    9600,
    19200,
    38400,
    57600,
    115200,
    2000000
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
}
