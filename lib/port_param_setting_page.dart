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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
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
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
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
                    width: 45,
                  ),
                  PortListDropDownButton(),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
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
                    width: 30,
                  ),
                  BaudrateDropDownButton()
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
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
                    width: 70,
                  ),
                  ParityDropDownButton()
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
          width: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
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
                    width: 80,
                  ),
                  StopBitDropDownButton()
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
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
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  Container(
                    width: 110,
                    child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryBlue)),
                        child: Text(
                          'Data Bits',
                          style: TextStyle(color: AppColors.white),
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 40,
                    child: DataBitsDropDownButton(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Container(
              color: Colors.black12,
              height: 40,
              width: 210,
              child: Row(
                children: [
                  Container(
                    width: 110,
                    child: ElevatedButton(
                        onPressed: null,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryBlue)),
                        child: Text(
                          '保存log',
                          style: TextStyle(color: AppColors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
