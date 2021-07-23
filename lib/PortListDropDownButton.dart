import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class PortListDropDownButton extends StatefulWidget {
  const PortListDropDownButton({Key? key}) : super(key: key);

  @override
  State<PortListDropDownButton> createState() => _PortListDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PortListDropDownButtonState extends State<PortListDropDownButton> {
  String dropdownValue = 'com6';

  @override
  Widget build(BuildContext context) {
    List<String> portList = ['com6', 'com7', 'com8', 'com9'];

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
