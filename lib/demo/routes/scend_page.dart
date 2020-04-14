import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScendPageState();
  }
}

class ScendPageState extends State<ScendPage> {

  ///页面创建时执行的第一个方法
  @override
  void initState() {
    super.initState();
  }
  ///页面创建执行的第二个方法
  ///页面 State、Context已绑定
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ///获取路由信息
    RouteSettings routeSettings = ModalRoute.of(context).settings;
    if(routeSettings!=null){
      ///获取传递的参数
      Map<String,String> arguments = routeSettings.arguments;
      if(arguments!=null){
        print("接收到参数 ${arguments["title"]}");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: (){
            ///这里是向上一个页面回传的数据
            Map<String,String> resultMap = new Map();
            resultMap["result"]="AESC";
            Navigator.of(context).pop(resultMap);
          },
        ),
      ),
    );
  }
}
