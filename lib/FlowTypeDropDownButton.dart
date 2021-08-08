import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/cue_serial_port_model.dart';

/// This is the stateful widget that the main application instantiates.
class FlowTypeDropDownButton extends StatefulWidget {
  final List<String> flowTypeList;
  final CueSerialPortModel model;
  final VoidCallback? onDropDownTap;
  final ValueChanged? onValueChanged;

  const FlowTypeDropDownButton({
    Key? key,
    required this.flowTypeList,
    required this.model,
    this.onDropDownTap,
    this.onValueChanged,
  }) : super(key: key);

  @override
  State<FlowTypeDropDownButton> createState() => _FlowTypeDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FlowTypeDropDownButtonState extends State<FlowTypeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: this.widget.model.value.flowType,
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
          this.widget.model.value.flowType = newValue!;
          this.widget.onValueChanged!(newValue);
        });
      },
      items: this
          .widget
          .flowTypeList
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
