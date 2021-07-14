import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This is the stateful widget that the main application instantiates.
class ParityDropDownButton extends StatefulWidget {
  const ParityDropDownButton({Key? key}) : super(key: key);

  @override
  State<ParityDropDownButton> createState() => _ParityDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ParityDropDownButtonState extends State<ParityDropDownButton> {
  String dropdownValue = 'none';

  @override
  Widget build(BuildContext context) {
    List<String> portList = [
      'none',
      'even',
      'odd',
      'mark',
      'space',
    ];

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
