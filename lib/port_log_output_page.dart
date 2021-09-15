import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/port_log_model.dart';

class PortLogOutputPage extends StatefulWidget {
  final ValueNotifier<PortLogModel> logValueNotifier;

  const PortLogOutputPage({Key? key, required this.logValueNotifier})
      : super(key: key);

  @override
  State<PortLogOutputPage> createState() {
    // TODO: implement createState
    return _PortLogOutputPage();
  }
}

class _PortLogOutputPage extends State<PortLogOutputPage> {
  ScrollController _scrollController = new ScrollController();
  List<PortLogModel> portLogList = [];

  @override
  void initState() {
    super.initState();
    developer.log("this.widget.logValueNotifier.value initState ");

    this.widget.logValueNotifier.addListener(() {
      var outputLog = this.widget.logValueNotifier.value;
      var outputLogLine =
          "[${outputLog.timeStamp}][${outputLog.deviceClock}][${outputLog.deviceLog}";
      developer
          .log("_PortLogOutputPage: initState: outputLogLine = $outputLogLine");
      setState(() {
        portLogList.add(this.widget.logValueNotifier.value);
      });
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 400,
          width: 950,
          color: Colors.grey[300],
          child: ListView.builder(
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: portLogList.length + 1,
            itemBuilder: (context, index) {
              if (index == portLogList.length) {
                return Container(
                  height: 70,
                );
              }
              var outputLog = portLogList[index];
              developer.log("messages[index].message: outputLog = $outputLog");
              return Row(
                children: [
                  Text(
                    "${outputLog.timeStamp.toString()}]${outputLog.deviceLog}",
                    style: TextStyle(color: Colors.blue[(index % 10) * 100]),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
