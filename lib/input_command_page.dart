import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCommandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputCommandPage();
  }
}

class _InputCommandPage extends State<InputCommandPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 300,
      child: TextField(),
    );
  }
}
