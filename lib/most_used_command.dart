import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostUsedCommandPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MostUsedCommandPage();
  }
}

class _MostUsedCommandPage extends State<MostUsedCommandPage> {
  @override
  Widget build(BuildContext context) {
    /// 命令的名称, 命令的类型
    return Container(
      width: 100,
      height: 600,
      child: Row(
        children: [Text('备注名称')],
      ),
    );
  }
}
