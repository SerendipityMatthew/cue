import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This is the stateful widget that the main application instantiates.
class FlowTypeDropDownButton extends StatefulWidget {
  const FlowTypeDropDownButton({Key? key}) : super(key: key);

  @override
  State<FlowTypeDropDownButton> createState() => _FlowTypeDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FlowTypeDropDownButtonState extends State<FlowTypeDropDownButton> {
  String dropdownValue = 'none';

  @override
  Widget build(BuildContext context) {
    List<String> portList = ['none', 'RTS/CTS', 'XON/XOFF'];

    return DropdownButton<String>(
      value: dropdownValue,
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
          dropdownValue = newValue!;
        });
      },
      items: portList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
