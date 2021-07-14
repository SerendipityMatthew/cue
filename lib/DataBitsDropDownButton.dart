import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This is the stateful widget that the main application instantiates.
class DataBitsDropDownButton extends StatefulWidget {
  const DataBitsDropDownButton({Key? key}) : super(key: key);

  @override
  State<DataBitsDropDownButton> createState() => _DataBitsDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DataBitsDropDownButtonState extends State<DataBitsDropDownButton> {
  String dropdownValue = '5';

  @override
  Widget build(BuildContext context) {
    List<String> portList = ['5', '6', '7', '8'];

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
