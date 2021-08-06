import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortLogOutputPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
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
          child: Text(
            "Flutter 支持三种模式编译 app，也支持使用 headless 模式来测试。这篇文档解释了这三种模式，并且告诉你什么时候应该使用哪种模式。关于 headless 测试的更多信息，可以查看 单元测试。选择哪种编译模式取决于你处于哪个开发周期中。是调试代码阶段，还是需要性能优化分析，抑或是准备部署你的应用了呢？快速简要介绍下列三种构建模式：",
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
