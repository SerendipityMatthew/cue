import 'package:cue/model/cue_serial_port_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
///

class PortListDropDownButton extends StatefulWidget {
  final List<String> portList;
  final ValueChanged<String?>? onValueChanged;
  final CueSerialPortModel model;
  final VoidCallback? onDropDownTap;

  const PortListDropDownButton(
      {Key? key,
      required this.portList,
      this.onValueChanged,
      required this.onDropDownTap,
      required this.model})
      : super(key: key);

  @override
  State<PortListDropDownButton> createState() => _PortListDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PortListDropDownButtonState extends State<PortListDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: this.widget.model.value.name,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onTap: this.widget.onDropDownTap,
      onChanged: (newValue) {
        setState(() {
          this.widget.model.value.name = newValue!;
          this.widget.onValueChanged!(newValue);
        });
      },
      items: this.widget.portList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(
            width: 140,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      }).toList(),
    );
  }
}
