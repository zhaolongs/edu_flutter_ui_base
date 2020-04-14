import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mdemo1/demo/dio/user_bean.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common_response.dart';
import 'cuestom_interceptor.dart';

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
      body: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("发起请求"),
                  onPressed: () {
                    getRequestFunction4();
                  },
                ),
                SizedBox(
                  width: 44,
                  height: 44,
                  child: CircularProgressIndicator(
                    value: currentProgress,
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                Text("用户的姓名是 ${mUserBean != null ? mUserBean.userName : ""}"),
                Text("用户的年龄是是 ${mUserBean != null ? mUserBean.age : ""}")
              ],
            ),
          )
        ],
      ),
    );
  }

  //get请求无参数
  void getRequestFunction4() async {


    ///请求地址 获取用户列表
    String url = "http://192.168.0.102:8080/getUserList";


    BaseOptions options = BaseOptions();

    ///请求header的配置
    options.headers["appVersionCode"]=406;
    options.headers["appVersionName"]="V 4.0.6";

//    options.contentType="application/json";
    options.method="GET";
    options.connectTimeout=30000;


    ///配置公共请求参数
    configCommonPar(url, null, null);

    ///创建Dio对象
    Dio dio = new Dio(options);

    ///设置代理
    _setupPROXY(dio);
    ///发起get请求
    Response response = await dio.get(url);

    ///响应数据
    var data = response.data;

    setState(() {
      result = data.toString();
    });
  }


















  ///get请求有参数
  ///获取所有的用户信息
  void getRequestFunction3() async {

    try {


      BaseOptions options = BaseOptions();

      ///请求header的配置
      options.headers["appVersionCode"]=406;
      options.headers["appVersionName"]="V 4.0.6";

      options.contentType="application/json";
      options.method="GET";
      options.connectTimeout=30000;
      ///创建 dio
      Dio dio = new Dio(options);

      ///配置dio代理
      _setupPROXY(dio);

      ///添加自定义拦截器
      dio.interceptors.add(CuestomInterceptor());

      ///请求地址
      String url = "http://192.168.0.102:8080/registerUser2";

      ///发起get请求
      Response response = await dio.get(url);

      ///响应数据
      Map<dynamic, dynamic> data = response.data;

      ///解析json数据
      CommonResponse commonResponse = CommonResponse.fromJson(data);

      List<UserBean> list = [];
      List<dynamic> preList = commonResponse.data;
      for (int i = 0; i < preList.length; i++) {
        Map<dynamic, dynamic> itmeMap = preList[i];
        UserBean userBean = UserBean.fromJson(itmeMap);
        list.add(userBean);
      }
    } on DioError catch(e){

      if(e.request!=null&&e.response==null){
        ///说明错误是发生在 请求前
      }else{
        ///说明错误是发生在请求后
      }

      print("出错了 ${e.message}" );
    }

  }
  ///当前进度进度百分比  当前进度/总进度 从0-1
  double currentProgress = 0.0;
  String apkUrl = "http://pic.studyyoun.com/2.1.2.apk";

  ///使用dio 下载文件
  void downApkFunction() async {
    /// 申请写文件权限
    bool isPermiss = await checkPermissFunction();
    if (isPermiss) {
      ///手机储存目录
      String savePath = await getPhoneLocalPath();
      String appName = "rk.apk";

      ///创建DIO
      Dio dio = new Dio();

      ///参数一 文件的网络储存URL
      ///参数二 下载的本地目录文件
      ///参数三 下载监听
      Response response = await dio.download(apkUrl, "$savePath$appName",
          onReceiveProgress: (received, total) {
        if (total != -1) {
          ///当前下载的百分比例
          print((received / total * 100).toStringAsFixed(0) + "%");
          // CircularProgressIndicator(value: currentProgress,) 进度 0-1
          currentProgress = received / total;
          setState(() {});
        }
      });
    } else {
      ///提示用户请同意权限申请
    }
  }

  ///PermissionGroup.storage 对应的是
  ///android 的外部存储 （External Storage）
  ///ios 的Documents` or `Downloads`
  checkPermissFunction() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      ///安卓平台中 checkPermissionStatus方法校验是否有储存卡的读写权限
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        ///无权限那么 调用方法 requestPermissions 申请权限
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        ///校验用户对权限申请的处理
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  ///获取手机的存储目录路径
  ///getExternalStorageDirectory() 获取的是  android 的外部存储 （External Storage）
  ///  getApplicationDocumentsDirectory 获取的是 ios 的Documents` or `Downloads` 目录
  Future<String> getPhoneLocalPath() async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }

  ///手机中的图片
  String localImagePath = "/storage/emulated/0/Download/17306285.jpg";

  ///上传的服务器地址
  String netUploadUrl = "http://192.168.0.102:8080/fileupload";

  ///dio 实现文件上传
  void fileUplod() async {
    ///创建Dio
    Dio dio = new Dio();

    Map<String, dynamic> map = Map();
    map["auth"] = "12345";
    map["file"] =
        await MultipartFile.fromFile(localImagePath, filename: "xxx23.png");

    ///通过FormData
    FormData formData = FormData.fromMap(map);

    ///发送post
    Response response = await dio.post(
      netUploadUrl, data: formData,

      ///这里是发送请求回调函数
      ///[progress] 当前的进度
      ///[total] 总进度
      onSendProgress: (int progress, int total) {
        print("当前进度是 $progress 总进度是 $total");
      },
    );

    ///服务器响应结果
    var data = response.data;
  }

  _setupPROXY(Dio dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        ///这里的 192.168.0.102:8888就是我们的代理服务地址
        return "PROXY 192.168.0.102:8888";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        return true;
      };
    };
  }



  ///post请求发送json
  void postRequestFunction2() async {
    String url = "http://192.168.0.102:8080/registerUser2";

    ///创建Dio
    Dio dio = new Dio();

    ///创建Map 封装参数
    Map<String, dynamic> map = Map();
    map['userName'] = "小明";
    map['userAge'] = 44;
    _setupPROXY(dio);

    ///发起post请求
    Response response = await dio.post(url, data: map);

    var data = response.data;
  }



  ///post 发送FormData
  void postRequestFunction() async {
    String url = "http://192.168.0.102:8080/registerUser";

    ///创建Dio
    Dio dio = new Dio();

    ///创建Map 封装参数
    Map<String, dynamic> map = Map();
    map['userName'] = "小明";
    map['userAge'] = 44;

    ///创建FormData
    FormData formData = FormData.fromMap(map);
    _setupPROXY(dio);

    ///发起post请求
    Response response = await dio.post(url, data: formData);

    var data = response.data;
  }

  //get请求无参数
  void getRequestFunction1() async {
    ///创建Dio对象
    Dio dio = new Dio();

    ///请求地址 获取用户列表
    String url = "http://192.168.0.102:8080/getUserList";

    ///发起get请求
    Response response = await dio.get(url);

    ///响应数据
    var data = response.data;

    setState(() {
      result = data.toString();
    });
  }

  UserBean mUserBean;


  CancelToken cancelToken = new CancelToken();
  ///get请求有参数
  ///根据用户ID来获取用户信息
  void getRequestFunction2() async {
    ///用户id
    int userId = 3;

    ///创建 dio
    Dio dio = new Dio();

    ///请求地址
    ///传参方式1
    String url = "http://192.168.0.102:8080/getUser/$userId";

    ///传参方式2
    String url2 = "http://192.168.0.102:8080/getUser?userId=$userId";

    ///传参方式 3
    String url3 = "http://192.168.0.102:8080/getUser";

    Map<String, dynamic> map = Map();
    map["userId"] = userId;
    dio.options.contentType="application/json";
    ///发起get请求
    Response response = await dio.get(url3, queryParameters: map,cancelToken: cancelToken);

 
    ///响应数据
    Map<String, dynamic> data = response.data;

    /// 将响应数据解析为 UserBean
    UserBean userBean = UserBean.fromJson(data);

    setState(() {
      mUserBean = userBean;
      result = data.toString();
    });
  }

  String application = "V 1.2.2";
  int appVersionCode = 122;
  ///[url]网络请求链接
  ///[data] post 请求时传的json数据
  ///[queryParameters] get请求时传的参数
  void configCommonPar(url,data,Map<String, dynamic> queryParameters,{String method="GET"}){
    if(method== "GET"){
      if(queryParameters!=null){
        queryParameters['application'] = application;
        queryParameters['appVersionCode'] = appVersionCode.toString();
      }else{
        ///url中有可能拼接着其他参数
        if (url.contains("?")) {
          url += "&application=$application&appVersionCode=$appVersionCode";
        } else {
          url += "?application=$application&appVersionCode=$appVersionCode";
        }
      }

    }else{
      if (data != null) {
        data['application'] = application;
        data['appVersionCode'] = appVersionCode.toString();
      }
    }
  }
}
