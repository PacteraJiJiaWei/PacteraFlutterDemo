import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo/Home/Search.dart';
import 'package:flutter_app_demo/Home/Message.dart';
import 'package:flutter_app_demo/Home/Setup.dart';
import 'package:flutter_app_demo/Tools/JFrame.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = BaseFrame.safeWidth();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,/// 去掉导航栏底部阴影
        actions: <Widget>[
          Container(
            color: Color.fromARGB(255, 201, 24, 45),
            width: width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 15.0,
                  left: 10.0,
                  height: 24.0,
                  width: 20.0,
                  child: GestureDetector(
                    child: Container(
                      child: Image.asset('images/leftImage.png',fit: BoxFit.fill,),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Setup();
                          }
                      ));
                    },
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 120.0,
                  right: 120.0,
                  height: 34.0,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'majica',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12.0,
                  right: 10.0,
                  height: 30.0,
                  width: 80.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(2.0),
                        child: Text(
                          '商品搜索',
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 201, 24, 45),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                            builder: (context) {
                              return Search();
                            }
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 240, 240, 240),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              /// 残高模块
              return Container(
                height: width,
                width: width,
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/homeAd.png'),
                      height: width/690*730,
                    ),
                    Positioned(
                      right: width/40,
                      top: width/40,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5.0,top: 5.0),
                        height: 80.0,
                        width: 80.0,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: Image.asset('images/homeAdItem.png'),
                          ),
                          onTap: () {
                            print('点击了右上角按钮');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (index == 1) {
              /// 广告模块
              return Container(
                height: width*164/720,
                margin: const EdgeInsets.only(left: 10.0,right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black26,
                    width: 2.0,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Image.asset(
                    'images/homeVipAd.png',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            } else {
              /// gridView模块
              return Container(
                height: (width-50)/4*(178.0/168.0),
                margin: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 178.0/168.0,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Image.asset('images/homeItem.png',),
                          ),
                          onTap: () {
                            Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
                                builder: (context) {
                                  return Message();
                                }
                            ));
                          },
                        ),
                        Offstage(
                          offstage: index==1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Color.fromARGB(100, 1, 1, 1),
                            ),
                            child: Image.asset('images/lock.png',height: 30.0,width: 30.0,),
                            alignment: Alignment.center,
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}