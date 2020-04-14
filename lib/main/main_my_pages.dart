

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdemo1/base/common_user_helper.dart';

class MainMyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return MainMyPageState();
  }

}

class MainMyPageState extends State{

  @override
  Widget build(BuildContext context) {

    return Container(color: Color(0xffF4F5F7),child:  Column(
      children: <Widget>[
        ///顶部菜单设置
        buildHeaderWidget(),
        Expanded(child: buildBodyWidget(),),
      ],
    ),);
  }

  buildHeaderWidget() {
    ///获取状态栏高度
   double top =  MediaQueryData.fromWindow(window).padding.top;
    return Container(child: Row(children: <Widget>[
      Expanded(flex: 4,child: Container(height: 44+top+12,padding: EdgeInsets.only(left: 16,bottom:12),alignment: Alignment(-1,1),color: Color(0xFFF0EBE6),child: Image.asset("images/2.0/my_add_icon.png",width: 20,height: 20,),),),
      Expanded(flex: 3,child: Container(height: 44+top+12,color: Color(0xFFF0EBE6),padding: EdgeInsets.only(right: 16,bottom: 12),alignment: Alignment(-1,1),child: Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[

        Container(width: 44,height: 26,alignment:Alignment.center,child: Text("签到",style: TextStyle(fontSize: 12,color: Colors.white),),decoration: BoxDecoration(color:Color(0xffFFA01D),borderRadius: BorderRadius.all(Radius.circular(4)) ),),
        SizedBox(width: 16,),
        Image.asset("images/2.0/my_setting_icon.png",width: 20,height: 20,),
        SizedBox(width: 16,),
        Image.asset("images/2.0/my_meun_icon.png",width: 20,height: 20,),
      ],),),),
    ],),);
  }

  buildBodyWidget() {
    return SingleChildScrollView(child: Column(children: <Widget>[
      Stack(children: <Widget>[
       Container(height: 160,color:Color(0xFFF0EBE6),),
        buildUserInforWidget(),
      ],)
    ],),);
  }

  buildCountBodyWidget(int count, String msg) {
    return Expanded(child:Container(child: Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
      ///数量
      Text("$count",style: TextStyle(color: Colors.black,fontSize: 20),),
        SizedBox(height: 10,),
      ///文字
      Text("$msg",style:TextStyle(color: Colors.grey,fontSize: 16),),
    ],),),);
  }

  buildUserInforWidget(){
    if(userIsLogin()){
      return buildUserLoginWidget();
    }else{
      return buildUserNoLoginWiget();
    }
  }
  buildUserLoginWidget(){
    return  ///用户已登录情况下
      Container(margin: EdgeInsets.only(left: 16,right: 16),height: 180,decoration: BoxDecoration(color:Color(0xffffffff),borderRadius: BorderRadius.all(Radius.circular(10))),
        child:Column(children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
            Container(margin: EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 16),child: ClipOval(child: Image.asset("images/2.0/my_title.png",width: 55,height: 55,),),),
            Expanded(child: Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
              Row(children: <Widget>[
                Text("早起的年轻人",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                SizedBox(width: 10,),
                Image.asset("images/2.0/my_man_icon.png",width: 20,height: 20,)
              ],),
              Row(children: <Widget>[
                Text("阅读111天，总时长212小时",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12,color: Color(0xFFBFBFBF)),),
                SizedBox(width: 10,),
                Image.asset("images/2.0/my_question_icon.png",width: 16,height: 16,)
              ],)
            ],),)
          ],),
          SizedBox(height: 14,),
          Row(crossAxisAlignment: CrossAxisAlignment.end,children: <Widget>[
            Expanded(child: Container(
              child: Row(children: <Widget>[
                buildCountBodyWidget(21,"关注"),
                buildCountBodyWidget(221,"粉丝"),
                buildCountBodyWidget(231,"访问"),
                buildCountBodyWidget(241,"排名"),
              ],),
            ),),
            SizedBox(width: 34,),
            Text("主页",style:TextStyle(color: Colors.grey,fontSize: 16),),
            SizedBox(width: 14,),
            ///小箭头
            Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 18,),

            SizedBox(width: 22,),
          ],
          ),
        ],) ,);
  }

  buildUserNoLoginWiget(){
    ///用户未登录情况UI
    return Container(margin: EdgeInsets.only(left: 16,right: 16),height: 180,decoration: BoxDecoration(color:Color(0xffffffff),borderRadius: BorderRadius.all(Radius.circular(10))),
        child:Container(child:Column(children: <Widget>[
          Expanded(child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border:Border.all(color: Color(0xFFF2F3F4))
                ),
                child: Image.asset("images/2.0/my_phone_icon.png",width: 26,height: 26,),
              ),
              Container(
                margin: EdgeInsets.only(left: 40,right: 40),
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border:Border.all(color: Color(0xFFF2F3F4))
                ),
                child: Image.asset("images/2.0/my_qq_icon.png",width: 26,height: 26,),
              ),
              Container(
                width: 54,
                height: 54,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border:Border.all(color: Color(0xFFF2F3F4))
                ),
                child: Image.asset("images/2.0/my_weixin_icon.png",width: 26,height: 26,),
              ),
            ],
          ),),

          Expanded(child:  Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(onTap: (){
                print("点击了登录");
              },
                child: Container(
                  width: 120,
                  height: 46,
                  alignment: Alignment(0,0),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Text("登录/注册",style: TextStyle(color:Colors.white),),),
              ),
            ],
          ),)
        ],),),);
  }

}