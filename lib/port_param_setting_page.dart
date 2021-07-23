import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BaudrateDropDownButton.dart';
import 'DataBitsDropDownButton.dart';
import 'FlowTypeDropDownButton.dart';
import 'ParityDropDownButton.dart';
import 'PortListDropDownButton.dart';
import 'StopBitDropDownButton.dart';
import 'colors/AppColors.dart';

/// This is the stateful widget that the main application instantiates.
class PortParamSettingPage extends StatefulWidget {
  const PortParamSettingPage({Key? key}) : super(key: key);

  @override
  State<PortParamSettingPage> createState() => _PortParamSettingPage();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PortParamSettingPage extends State<PortParamSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
