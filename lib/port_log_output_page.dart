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
  ScrollController _scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 400,
          width: 950,
          color: Colors.grey[300],
          child: ListView(
            controller: _scrollController,
            reverse: true,
            children: [
              buildValueListenableBuilder(),
            ],
          ),
        ),
      ],
    );
  }

  ///第二步定义 数据变化后监听的 Widget
  Widget buildValueListenableBuilder() {
    return ValueListenableBuilder(
      ///数据发生变化时回调
      builder: (context, value, child) {
        _scrollController.animateTo(0.0,
            duration: Duration(microseconds: 300), curve: Curves.easeOut);
        return Text(value.toString());
      },

      ///监听的数据
      valueListenable: this.widget.logValueNotifier,
    );
  }
}
