

///2.9.5  配置自定义语言配置代理 MyLocationsLanguageDelegates的实现
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class MyLocationsLanguageDelegates extends LocalizationsDelegate<MyLocationsLanguages>{

  ///创建默认构造
  const MyLocationsLanguageDelegates();
  ///创建静态构造
  static MyLocationsLanguageDelegates delegate = new MyLocationsLanguageDelegates();

  @override
  bool isSupported(Locale locale) {
    ///判断是否支持 ['en','zh'] 其中的一个
    return ['en','zh'].contains(locale.languageCode);
  }

  ///通过load方法关联我们自定义的多语言配制文件MyLocationsLanguages的
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

///2.9.5  配置自定义语言配置代理  多语言环境文字文件
///定义程序中使用到的文字 多语言适配
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
      'enlish' : "Select English",
      'Chinese':"Select Chinese",
      'ShowDate':"Show Date",
    },
    ///中文支持
    'zh': {
      'enlish' : "选择英语",
      'Chinese':"选择中文",
      'ShowDate':"显示日期",
    },
  };


  ///外部引用的方法
  get button1{
    return localValue[locale.languageCode]['button1'];
  }
  get button2{
    return localValue[locale.languageCode]['button2'];
  }
  get button3{
    return localValue[locale.languageCode]['button3'];
  }

  get selectChinese{
    return localValue[locale.languageCode]['Chinese'];
  }

  get selectEnlish{
    return localValue[locale.languageCode]['enlish'];
  }

  get selectShowDate{
    return localValue[locale.languageCode]['ShowDate'];
  }
}