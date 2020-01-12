
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewSPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State {
  List list = [];

  ScrollController scrollController = new ScrollController();

  num offsetFlag =0;
  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 30; i++) {
      list.add("iteme $i");
    }
    ///添加滑动兼听
    scrollController.addListener((){
      ///offset 指的是 scrollController 兼听的 ListView 滑动的顶部 与 ListView 的距离
      num offset = scrollController.offset;
//      print("兼听到了滑动 $offset");

      if(offset ==0){
        offsetFlag =0;
      }else if(offset<0){
        offsetFlag =1;
      }else{
        offsetFlag =2;
      }
      setState(() {

      });



      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        print("滑动到了最底部");
        loadMore();
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    IconData iconData = Icons.home;
    if(offsetFlag==0){
      iconData = Icons.home;
    }else if(offsetFlag==1){
      iconData = Icons.arrow_downward;
    }else{
      iconData = Icons.arrow_upward;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView s"),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){


        ///回到顶部
      if(offsetFlag==2){
        scrollController.animateTo(-100, duration: new Duration(milliseconds: 1000), curve: Curves.ease);
      }
        ///

      },child: Icon(iconData),),

      ///RefreshIndicator 刷新组件
      body: RefreshIndicator(
        ///刷新组件圆圈 距离顶部的距离
        displacement: 40,
        ///刷新组件圆圈 的颜色
        color: Colors.red,
        ///刷新组件圆圈 的新景颜色
        backgroundColor: Colors.grey,
        child: buildListView(),onRefresh:onRefresh,),
    );
  }


  Future<void> onRefresh () async {
    print("下拉刷新 ");
    list.clear();
    for (int i = 0; i < 30; i++) {
      list.add("下拉刷新 数据 $i");
    }
    await Future.delayed(Duration(milliseconds: 3000),(){
      print("下拉刷新结束");
     setState(() {

     });
    });
  }

  ///用来加载 列表式布局 自带分隔线
  Widget buildListView(){
    return ListView.separated(
      ///用来监听和处理ListView的滑动事件
      controller: scrollController,
      ///构建分隔线
      separatorBuilder: (BuildContext context,num index){
        if(index%2==0){
          return Container(height: 2,color: Colors.blue,);
        }
        return Container(height: 2,color: Colors.red,);
      },
      ///用来构建 子条目
      /// index 是条目的角标
      itemBuilder: (BuildContext context, num index) {
        if(index == list.length){
          return Container(alignment: Alignment.center,height: 88,color: Colors.grey,child: Text("加载更多",style: TextStyle(color: Colors.white),),);
        }
        return Container(
          color: Colors.grey[300],
          height: 88,
          child: Text(list[index]),
        );
      },
      ///数据的个数
      itemCount: list.length+1,
    );
  }

  void loadMore() {
    for (int i = 0; i < 30; i++) {
      list.add("加载更多数据 数据 $i");
    }

    setState(() {

    });
  }
}
