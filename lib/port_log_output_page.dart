import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortLogOutputPage extends StatefulWidget {
  final ValueNotifier<String> logValueNotifier;

  const PortLogOutputPage({Key? key, required this.logValueNotifier})
      : super(key: key);

  @override
  State<PortLogOutputPage> createState() {
    // TODO: implement createState
    return _PortLogOutputPage();
  }
}

class _PortLogOutputPage extends State<PortLogOutputPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Container(
          height: 400,
          width: 950,
          color: Colors.grey[300],
          child: buildValueListenableBuilder(),
        ),
      ],
    );
  }

  ///第二步定义 数据变化后监听的 Widget
  Widget buildValueListenableBuilder() {
    return ValueListenableBuilder(
      ///数据发生变化时回调
      builder: (context, value, child) {
        return Text(value.toString());
      },

      ///监听的数据
      valueListenable: this.widget.logValueNotifier,
    );
  }

  ///第三步就是数据变化后
  void testFunction() {
    ///赋值更新
    this.widget.logValueNotifier.value = '传递的测试数据';
  }
}
