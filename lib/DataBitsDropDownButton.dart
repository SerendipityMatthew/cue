import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'model/cue_serial_port_model.dart';

/// This is the stateful widget that the main application instantiates.
class DataBitsDropDownButton extends StatefulWidget {
  final List<int> dataBitsList;
  final ValueChanged<String?>? onValueChanged;
  final CueSerialPortModel model;
  final VoidCallback? onDropDownTap;

  const DataBitsDropDownButton(
      {Key? key,
      required this.dataBitsList,
      required this.model,
      this.onValueChanged,
      this.onDropDownTap})
      : super(key: key);

  @override
  State<DataBitsDropDownButton> createState() => _DataBitsDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DataBitsDropDownButtonState extends State<DataBitsDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: this.widget.model.value.dataBits.toString(),
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
          this.widget.model.value.dataBits = int.parse(newValue!);
          this.widget.onValueChanged!(newValue);
        });
      },
      items:
          this.widget.dataBitsList.map<DropdownMenuItem<String>>((int? value) {
        return DropdownMenuItem<String>(
          value: value.toString(),
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
