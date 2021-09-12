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
  List<Card> cardList = new List.generate(300, (int index) {
    return Card(
      color: Colors.blue[100],
      child: Container(
        width: 50.0,
        height: 15.0,
        child: SelectableText("", onSelectionChanged: (selection, cause) {
          if (cause == SelectionChangedCause.tap) {
            String selectedText = "Matthew"
                .substring(selection.baseOffset, selection.extentOffset);
            developer.log(
                "selection = $selection, cause = $cause, selectedText = $selectedText");
          }
        }),
      ),
    );
  });

  @override
  void initState() {
    super.initState();
    this.widget.logValueNotifier.addListener(() {
      var outputLog = this.widget.logValueNotifier.value;
      var outputLogLine =
          "[${outputLog.timeStamp}][${outputLog.deviceClock}][${outputLog.deviceLog}";
      var lineCount = "\n".allMatches(outputLog.deviceLog).length;
      developer.log("initState: lineCount = $lineCount");
      lineCount += 1;

      setState(() {
        cardList.add(Card(
          color: Colors.blue[100],
          child: Container(
            width: 50.0,
            height: lineCount * 20,
            child: SelectableText(outputLogLine,
                onSelectionChanged: (selection, cause) {
              if (cause == SelectionChangedCause.tap) {
                String selectedText = outputLogLine
                    .toString()
                    .substring(selection.baseOffset, selection.extentOffset);
                developer.log(
                    "selection = $selection, cause = $cause, selectedText = $selectedText");
              }
            }),
          ),
        ));
      });
      developer.log("this.widget.logValueNotifier.value = $outputLogLine");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 400,
          width: 950,
          color: Colors.grey[300],
          child: ListView(
            controller: _scrollController,
            reverse: true,
            children: cardList,
          ),
        ),
      ],
    );
  }
}
