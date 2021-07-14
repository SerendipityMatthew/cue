import 'package:cue/BaudrateDropDownButton.dart';
import 'package:cue/DataBitsDropDownButton.dart';
import 'package:cue/FlowTypeDropDownButton.dart';
import 'package:cue/ParityDropDownButton.dart';
import 'package:cue/StopBitDropDownButton.dart';
import 'package:cue/colors/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryBlue)),
                  child: Text(
                    "Listen Port",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      "Open Port",
                      style: TextStyle(color: AppColors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                PortListDropDownButton(),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      'Baudrate',
                      style: TextStyle(color: AppColors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                BaudrateDropDownButton()
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      'Parity',
                      style: TextStyle(color: AppColors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                ParityDropDownButton()
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      'Stop Bits',
                      style: TextStyle(color: AppColors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                StopBitDropDownButton()
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      'Flow Type',
                      style: TextStyle(color: AppColors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                FlowTypeDropDownButton()
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryBlue)),
                    child: Text(
                      'Data Bits',
                      style: TextStyle(color: AppColors.white),
                    )),
                SizedBox(
                  width: 10,
                ),
                DataBitsDropDownButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
