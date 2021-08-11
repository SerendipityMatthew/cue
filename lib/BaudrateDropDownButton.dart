import 'dart:developer' as developer;

import 'package:cue/utils/NumberUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/cue_serial_port_model.dart';

/// This is the stateful widget that the main application instantiates.
class BaudrateDropDownButton extends StatefulWidget {
  final List<String> baudRateList;
  final ValueChanged<String?>? onValueChanged;
  final CueSerialPortModel model;
  final VoidCallback? onDropDownTap;

  const BaudrateDropDownButton(
      {Key? key,
      required this.baudRateList,
      this.onValueChanged,
      this.onDropDownTap,
      required this.model})
      : super(key: key);

  @override
  State<BaudrateDropDownButton> createState() => _BaudrateDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BaudrateDropDownButtonState extends State<BaudrateDropDownButton> {
  @override
  Widget build(BuildContext context) {
    var dropDownButton = DropdownButton<String>(
      value: NumberUtils.formatBaudrate(this.widget.model.value.baudRate),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          String stripValue = newValue!.toString().replaceAll(",", "");
          developer.log("stripValue = $stripValue");
          this.widget.model.value.baudRate = int.parse(stripValue);
          this.widget.onValueChanged!(stripValue);
        });
      },
      items: this
          .widget
          .baudRateList
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(value.toString()),
        );
      }).toList(),
    );
    return dropDownButton;
  }
}
