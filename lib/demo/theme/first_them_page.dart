import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/demo/routes/scend_page.dart';

class FirstThemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstThemPage> with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController= new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'tootips',
          onPressed: () => debugPrint('Navigreation button is pressed'),
        ),
        title: Text('导航'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: () => debugPrint('Search button is pressed'),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            tooltip: '更多',
            onPressed: () => debugPrint('More button is pressed'),
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.message)),
            Tab(icon: Icon(Icons.library_add)),
          ],
        ),
      ),
      body: Column(children: <Widget>[
        Container(height: 200, width: 200),
        SizedBox(height: 20,),
        FlatButton(child: Text("这是一个Button"), onPressed: () {},),
        SizedBox(height: 20,),
        Switch(value: true, onChanged: (bool value) {},),
        Checkbox(onChanged: (bool value) {  }, value: true,),
        Radio(groupValue: 1, onChanged: (int value) {  },),
      ],),
      floatingActionButton: FloatingActionButton(onPressed: () {  },child:Icon(Icons.add) ,),
    );
  }
}
