import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Tabbar/JMainScaffold.dart';
import 'package:flutter_app_demo/Tabbar/JMainTabbarItem.dart';
import 'package:flutter_app_demo/Home/Home.dart';
import 'package:flutter_app_demo/Coupon/Coupon.dart';
import 'package:flutter_app_demo/Member/Member.dart';
import 'package:flutter_app_demo/Message/Message.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: JMainScaffold(
        currentIndex: 0,
        items: [
          JmainTabbarItemBean(
            nomalColor: Colors.white,
            selectColor: Colors.white,
            title: 'ホーム',
            titleFont: 11.0,
            nomalImg: 'images/1.png',
            selectImg: 'images/1.png',
            type: JMainTabbarItemType.nomal,
            controller: Home(),
          ),
          JmainTabbarItemBean(
            nomalColor: Colors.white,
            selectColor: Colors.white,
            title: 'クーポン',
            titleFont: 11.0,
            nomalImg: 'images/2.png',
            selectImg: 'images/2.png',
            type: JMainTabbarItemType.nomal,
            controller: Coupon(),
          ),
          JmainTabbarItemBean(
            nomalImg: 'images/addNomal.png',
            selectImg: 'images/addNomal.png',
            type: JMainTabbarItemType.boost,
            controller: Member(),
          ),
          JmainTabbarItemBean(
            nomalColor: Colors.white,
            selectColor: Colors.white,
            title: 'メッセージ',
            titleFont: 11.0,
            nomalImg: 'images/4.png',
            selectImg: 'images/4.png',
            type: JMainTabbarItemType.nomal,
            controller: page2('メッセージ'),
          ),
          JmainTabbarItemBean(
            nomalColor: Colors.white,
            selectColor: Colors.white,
            title: '詳細',
            titleFont: 11.0,
            nomalImg: 'images/5.png',
            selectImg: 'images/5.png',
            type: JMainTabbarItemType.nomal,
            controller: home(),
          ),
        ],
      ),
    );
  }
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(color: Colors.grey,);
  }
}