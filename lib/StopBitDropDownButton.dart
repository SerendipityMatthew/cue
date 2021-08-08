import 'package:cue/constants/port_param_constant.dart';
import 'package:cue/model/cue_serial_port_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// This is the stateful widget that the main application instantiates.
class StopBitDropDownButton extends StatefulWidget {
  final List<String> stopBitList;
  final ValueChanged<String?>? onValueChanged;
  final CueSerialPortModel portModel;
  const StopBitDropDownButton(
      {Key? key,
      required this.stopBitList,
      required this.onValueChanged,
      required this.portModel})
      : super(key: key);

  @override
  State<StopBitDropDownButton> createState() => _StopBitDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _StopBitDropDownButtonState extends State<StopBitDropDownButton> {
  @override
  Widget build(BuildContext context) {
    List<String> stopBitList = PortParamConstant.PORT_STOP_BIT_LIST;

    return DropdownButton<String>(
      value: this.widget.portModel.value.stopBits,
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
          this.widget.portModel.value.stopBits = newValue!;
          this.widget.onValueChanged!(newValue);
        });
      },
      items: stopBitList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
