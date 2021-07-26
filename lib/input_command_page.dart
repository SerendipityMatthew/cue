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
      color: Colors.grey[300],
      width: 950,
      height: 200,
      child: TextField(
        minLines: 10,
        maxLines: 20,
      ),
    );
  }
}
