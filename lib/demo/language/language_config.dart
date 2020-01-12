


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MyLocationsLanguageDelegates extends LocalizationsDelegate<MyLocationsLanguages>{

  ///创建默认构造
  const MyLocationsLanguageDelegates();
  ///创建静态构造
  static MyLocationsLanguageDelegates delegate = new MyLocationsLanguageDelegates();

  @override
  bool isSupported(Locale locale) {
    ///判断是否支持 ['en','zh','he'] 其中的一个
    return ['en','zh','he'].contains(locale.languageCode);
  }

  @override
  Future<MyLocationsLanguages> load(Locale locale) {
    ///异步初始化MyLocationsLanguages
    return SynchronousFuture(MyLocationsLanguages(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
   ///是否需要重载
    return false;
  }

}

///定义程序 多语言适配
class MyLocationsLanguages {

  ///记录当前应用程序使用到的本地化配制
  final Locale locale;

  MyLocationsLanguages(this.locale);

  ///定义一个静态方法来初始化 MyLocationsLanguages
  static of(BuildContext context){
    return Localizations.of(context, MyLocationsLanguages);
  }

  ///定义多语言环境支持数据
  static Map<String ,Map<String,String>> localValue = {

    ///英文支持
    'en': {
      'task title': 'Flutter Demo',
      'titlebar title': 'Flutter Demo Home Page',
      'click tip': 'You have pushed the demo.button this many times:',
      'inc': 'Increment',
      'click demo.button': 'click select demo.language',
      'welcomes': 'China welcomes you',
      'button1' : " China Language ",
      'button2' : " English Language ",
      'button3' : " Spain Language ",
    },
    ///中文支持
    'zh': {
      'task title': 'Flutter 示例',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': '你一共点击了这么多次按钮：',
      'inc': '增加',
      'click demo.button': '点击切换',
      'welcomes': '中国欢迎你',
      'button1' : '简体中文',
      'button2' : " 英文",
      'button3' : " 西班牙 ",
    },
    ///西班牙语支持
    'he': {
      'task title': 'Ejemplo de Flutter',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': 'Has hecho clic en los botones tantas veces en total：',
      'inc': '增加',
      'click demo.button': 'Haga clic en cambiar',
      'welcomes': 'Bienvenido a China',
      'button1' : 'Chino simplificado ',
      'button2' : "ingies",
      'button3' : " Linares ",
    }
  };


  get button1{
    return localValue[locale.languageCode]['button1'];
  }
  get button2{
    return localValue[locale.languageCode]['button2'];
  }
  get button3{
    return localValue[locale.languageCode]['button3'];
  }
}