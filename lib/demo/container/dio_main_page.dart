import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///程序入口
void main() => runApp(RootDioApp());

class RootDioApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RootDioAppState();
  }
}

class RootDioAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DioMainPage(),
    );
  }
}

class DioMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DioMainPageState();
  }
}

class DioMainPageState extends State {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求dio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text("发起请求"),
            onPressed: () {
              getImage();
            },
          ),
          Text("请求的数据 $result")
        ],
      ),
    );
  }

  void getRequestFunction() async {
    ///创建Dio
    Dio dio = new Dio();

    ///发起 get 请求
    Response response = await dio.get("https://autumnfish.cn/api/joke");
    print(response.data.toString());
    // 请求参数也可以通过对象传递，上面的代码等同于：
//    response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"})
//    print(response.data.toString());
    result = response.data.toString();
    setState(() {});
  }

  void getRequestFunction2() async {
    ///创建Dio
    Dio dio = new Dio();

    ///发起 get 请求
    Response response = await dio.get("https://autumnfish.cn/api/joke/list",
        queryParameters: {"num": 3});
    result = response.data.toString();
    setState(() {});
  }

  void postRequestFunction() async {
    ///创建Dio
    Dio dio = new Dio();
    ///发送 FormData:
    FormData formData = FormData.fromMap({"name": "张三", "age": 22});
    String url ="http://192.168.200.68:8080/registerUser";
    ///发起 post 请求 如这里的注册用户信息
    Response response = await dio
        .post(url, data: formData);
    result = response.data.toString();
    setState(() {});
  }

  void postRequestFunction2() async {
    ///创建Dio
    Dio dio = new Dio();

    ///发起 post 请求
    ///RequestBody
    Response response = await dio.post(
        "http://192.168.200.68:8080/registerUser2",
        data: {"name": "张三", "age": 22});
    result = response.data.toString();
    setState(() {});
  }

  void _upLoadImage(File image) async {
    var fileDir=image.path;

    FormData formData = FormData.fromMap({
      "name": "zhangsna 6666666666",
      "age": 20,
      "sex": "男",
      "file":  await MultipartFile.fromFile(fileDir, filename: "xxx.jpg")
    });
    Dio dio = new Dio();
    var respone = await dio.post("http://192.168.200.68:8080/fileupload", data: formData,);
    if (respone.statusCode == 200) {

    }
  }

  File _image;

  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _upLoadImage(image); //上传图片
    setState(() {
      _image = image;
    });
  }
}
