import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Home/Setup.dart';
import 'package:flutter_app_demo/Tools/JSegument.dart';
import 'package:flutter_app_demo/Tools/JFrame.dart';
import 'package:flutter_app_demo/Tools/JMemberProgressHUD.dart';

class Member extends StatefulWidget {
  bool isFirst = true;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MemberState();
  }
}

class MemberState extends State<Member> {

  /// 展示提示用户的HUD
  showHUD(BuildContext context, bool first) async{
    if (widget.isFirst) {
      await new Future.delayed(const Duration(seconds: 0), () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return JMemberProgressHUD();
            }
        );
      });
      widget.isFirst = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = BaseFrame.safeWidth();
    double h = BaseFrame.safeHeight()-56.0-49.0;

    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
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
                    left: 40.0,
                    right: 40.0,
                    height: 34.0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '会員証バーコード',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              JSegument(
                height: h,
                width: width,
                beans: [
                  JSegumentBean(
                    title: 'majicaカード',
                    nomalColor: Colors.black26,
                    selectColor: Color.fromARGB(255, 201, 24, 45),
                    widget: Container(
                      color: Colors.white,
                    ),
                  ),
                  JSegumentBean(
                    title: 'クーポン',
                    nomalColor: Colors.black26,
                    selectColor: Color.fromARGB(255, 201, 24, 45),
                    widget: Container(
                      color: Color.fromARGB(255, 245, 245, 245),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            alignment: Alignment.center,
                            child: Text(
                              'この画面を\nクーポン発券機にかざしてください。',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Container(
                              height: width/2*1.2,
                              width: width/2,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: 100.0,
                            alignment: Alignment.center,
                            child: Text(
                              '発見されたクーポン券と対象商品を併せて\nレジまでお持ちください。',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black
                              ),
                            ),
                          ),
                          Container(
                            height: 100.0,
                            alignment: Alignment.center,
                            child: Text(
                              'クーポンの利用方法は、\n「使い方」よりご確認ください。',
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black26
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                black: (index) {
                  if (index == 1) {
                    showHUD(context, widget.isFirst);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}