import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This is the stateful widget that the main application instantiates.
class BaudrateDropDownButton extends StatefulWidget {
  const BaudrateDropDownButton({Key? key}) : super(key: key);

  @override
  State<BaudrateDropDownButton> createState() => _BaudrateDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BaudrateDropDownButtonState extends State<BaudrateDropDownButton> {
  String dropdownValue = '9 600';

  @override
  Widget build(BuildContext context) {
    List<String> portList = [
      '9 600',
      '19 200',
      '38 400',
      '57 600',
      '115 200',
      '200 000'
    ];

    var dropDownButton = DropdownButton<String>(
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
    return dropDownButton;
  }
}
