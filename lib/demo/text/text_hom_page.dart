import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextHomePageState();
  }
}

class TextHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text 讲解"),
      ),
      body: Center(
        ///SizedBox 用来限制一个固定 width height 的空间
        child: SizedBox(
          width: 200,
          height: 200,
          child: Container(
            color: Colors.yellow,
            ///Alignment 用来对齐 Widget
            alignment: Alignment(0,0),
            child: Text(
              "这里是body body body body ",
              ///用来设置文字的样式
              style: TextStyle(
                ///设置文字的颜色
                color: Colors.deepPurple,
                ///设置文字的大小
                fontSize: 16.0,
                ///用设置 Text 的线
                ///   TextDecoration.none 没有
                ///   TextDecoration.underline 下划线
                ///   TextDecoration.overline  上划线
                ///   TextDecoration.lineThrough 删除线
                decoration: TextDecoration.none,
                /// 设置下划线的颜色
                decorationColor: Colors.green,
                /// 设置下划线的样式
                  ///   TextDecorationStyle.dashed 设置为虚线
                  ///   TextDecorationStyle.solid 设置为实线
                  ///   TextDecorationStyle.double 两条实线
                  ///   TextDecorationStyle.wavy  波浪线
                decorationStyle: TextDecorationStyle.wavy,
                ///设置文字为粗体
                  ///   FontWeight.bold 粗体
                fontWeight: FontWeight.w600,
                ///设置 斜体
                fontStyle: FontStyle.italic,
                ///用来设置 单字之间的距离
                letterSpacing: 5.0,
                ///用来设置 单词之间的距离
                wordSpacing: 5.0,
                ///控制行高 倍数（默认行高的倍数）
                height: 1.5,
                ///文本的背景颜色
                backgroundColor: Colors.red,
                ///Decoration背景设定
//                shadows:
              ),
              ///限制Text 显示文本的最大行数 如果超出了 默认裁剪掉
              maxLines: 2,
              ///默认使用的 文本超出限制后自动裁剪
              ///TextOverflow.demo.clip 自动裁剪
              ///TextOverflow.ellipsis 文本超出限制后 显示省略号
              ///TextOverflow.fade 将超出的文本 透明化
              overflow: TextOverflow.ellipsis,
              ///来控制文本是否需要换行， false 不会换行，文本将会有一个无限长的水平空间
              /// 与 maxLines overflow 是互斥的 如果 设置了 maxLines overflow softWrap 不再起作用
              softWrap: true,
              ///设置文本的对齐方式
              ///TextAlign.center 居中
              ///TextAlign.left 靠左对齐
              ///TextAlign.right 靠右对齐
              ///TextAlign.justify 拉伸以结束的文本行以填充容器的宽度。即使用了decorationStyle才起效
              ///TextAlign.start  针对 文字方向来使用 textDirection
              ///          TextDirection.ltr  TextAlign.start 左对齐
              ///           extDirection.rtl  TextAlign.start 右对齐
              ///TextAlign.end
              ///          TextDirection.ltr  TextAlign.end 右对齐
              ///          TextDirection.rtl  TextAlign.end 左对齐
              textAlign: TextAlign.center,
              /// 用来设置文字的绘制方向的
              /// TextDirection.ltr left to  right 文字从左向右
              /// TextDirection.rtl right to left  文字从右向左
              textDirection: TextDirection.ltr,
              ///设置文本的缩放大小倍数
              ///根据文本的大小 X 屏幕像素密度 --->文本在屏幕上显示的大小 12 * 2.0 ===24
              ///如果为null，将使用从环境MediaQuery获取的MediaQueryData.textScaleFactor 即手机的像素密度（1.0、1.5、2.0、3.0）
              textScaleFactor: 1.0,

            ),
          ),
        ),
      ),
    );
  }
}
