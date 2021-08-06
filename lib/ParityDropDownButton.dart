import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/cue_serial_port_model.dart';

/// This is the stateful widget that the main application instantiates.
class ParityDropDownButton extends StatefulWidget {
  final List<String> parityList;
  final ValueChanged<String?>? onValueChanged;
  final CueSerialPortModel model;
  final VoidCallback? onDropDownTap;

  const ParityDropDownButton(
      {Key? key,
      required this.parityList,
      required this.model,
      this.onValueChanged,
      this.onDropDownTap})
      : super(key: key);

  @override
  State<ParityDropDownButton> createState() => _ParityDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ParityDropDownButtonState extends State<ParityDropDownButton> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: this.widget.model.value.parity,
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
          this.widget.model.value.parity = newValue!;
          this.widget.onValueChanged!(newValue);
        });
      },
      items:
          this.widget.parityList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
