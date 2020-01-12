import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ImageHomePagePageState();
  }
}

/// 加载网络图片
class ImageHomePagePageState extends State {
  String imageUrl =
      "https://timgsa.baidu.com/timg?demo.image&quality=80&size=b9999_10000&sec=1578583093&di=0bf687d9589dc5c6c0778de9576ee077&imgtype=jpg&er=1&src=http%3A%2F%2Ffile.mumayi.com%2Fforum%2F201403%2F28%2F111010vhgc45hkh41f1mfd.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Image 配制"),
      ),

      ///线性布局
      body: Column(
        children: <Widget>[
          ///Image 是 Flutter 应用开发中用来加载显示图片的
          Image(
            /// image 是用来加载 图片资源的
            /// NetworkImage 用来加载网络图片的
            image: NetworkImage(imageUrl),

            ///设置显示图片的宽
            width: 400,

            ///设置显示图片高
            height: 280,

            ///用来设置图片的填充模式
            /// BoxFit.fill 显示的图片填充 Image 的大小 拉伸
            /// BoxFit.cover 显示的图片 会按图片的宽高比例进行缩放 不会拉伸，多出的部分会被裁剪
            /// BoxFit.contain 默认使用的加载 模式 图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形
            /// BoxFit.fitHeight 在 高度方向 缩放到 Image 的height，然后图片的 width 会
            /// BoxFit.none 没有任何加载策略 从左上角开发加载
            fit: BoxFit.contain,

            /// 设置图片的对齐方式
            alignment: Alignment.topCenter,

            ///设置图片的颜色
            color: Color(0xff666666),

            /// color 与图片的混合模式
            /// BlendMode.src 只绘制 color 设置的颜色 不会去绘制图片
            /// BlendMode.dst 只绘制 图片 不会去绘制 color 颜色
            /// BlendMode.srcOver 绘制 color 覆盖在 图片上
            /// BlendMode.dstIn  绘制 color 与 图片 重叠的部分 color 蒙版
            /// BlendMode.dstOut 绘制 color 与 图片 不重叠的部分
            /// BlendMode.clear 清除内容

            /// BlendMode.colorBurn 获取对比度特别强的图像
            /// BlendMode.colorDodge 获取爆光度特别强的图像
            /// BlendMode.darken 获取暗色的图像
            /// BlendMode.difference 暗色 爆光度
            /// BlendMode.dstOver 绘制  图片 覆盖在color上
            /// BlendMode.exclusion 绘制 color 覆盖在 图片上 color 的颜色 更深点
            /// BlendMode.hardLight
            /// BlendMode.hue 获取黑白图像  获取 color 的色调 ，获取 图片的 饱和度与亮度
            /// BlendMode.color 获取黑白图像 获取 color 的色调 饱和度，获取图片的亮度
            /// BlendMode.lighten
            /// BlendMode.luminosity 获取 color 的亮度，获取 图片的色调  饱和度 来合成
            /// BlendMode.modulate 将 color 与图片的 颜色分量 相乘得到的结果
            colorBlendMode: BlendMode.dst,

            /// 图片的重复显示模式
            ///  ImageRepeat.noRepeat 不重复
            ///  ImageRepeat.repeat 重复
            ///  ImageRepeat.repeatX 中在X轴方向上有重复
            ///  ImageRepeat.repeatY 在Y轴方向上有重复
            repeat: ImageRepeat.noRepeat,
          ),

          ///NetworkImage Image.network  效果一至 都是用来加载网络图片的
          ///ClipOval 用来将子 Widget 裁剪成圆形或者 椭圆
          ClipOval(
            child: Container(
              color: Colors.grey,
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
              ),
            ),
          ),

          ///FadeInImage 有渐变效果的加载图片
          ///placeholder 过度图片
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 40,
          ),
//          Container(
//            color: Colors.grey,
//            child: ClipRRect(
//              child: FadeInImage.assetNetwork(
//                  placeholder: "images/2.0/logo.jpg", image: imageUrl),
//              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
//            ),
//          ),
          CachedNetworkImage(
            ///
            imageUrl: imageUrl,
            ///图片加载 中的占位图
            ///CircularProgressIndicator 圆形进度条
            placeholder: (context, url) => CircularProgressIndicator(),
            ///图片加载出错时显示 的Widget
            errorWidget: (context, url, error) => Text("加载出错了",style: TextStyle(color: Colors.red),),
          ),
          //Container(color: Colors.grey,child: FadeInImage.assetNetwork(placeholder: "images/2.0/logo.jpg", image: imageUrl),)
        ],
      ),
    );
  }
}
