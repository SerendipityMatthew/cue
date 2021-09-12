import 'package:flutter/foundation.dart';

class PortLogModel extends ChangeNotifier {
  final DateTime timeStamp;
  final String deviceClock;
  final String deviceLog;

  PortLogModel(
    this.timeStamp,
    this.deviceClock,
    this.deviceLog,
  );
}
