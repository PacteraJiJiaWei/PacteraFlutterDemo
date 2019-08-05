import 'package:flutter/material.dart';

class JMemberProgressHUD extends Dialog {
  double left_magin = 30.0;
  double scale = 1;
  double borderRadius = 10.0;
  bool select = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double w = width-left_magin*2;
    double h = w*scale;
    return Container(
      alignment: Alignment.center,
      child: Material( //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Container(
          height: h,
          width: w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 201, 24, 45),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))
          ),
          child: Column(
            children: <Widget>[
              /// 标题
              Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: h*0.15,
                    width: w,
                    child: Text(
                      'ご案内',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Positioned(
                    top: (h*0.15-20)/2,
                    right: (h*0.15-20)/2,
                    height: 20.0,
                    width: 20.0,
                    child: GestureDetector(
                      child: Image.asset('images/close.png'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
              /// 白色区域
              Container(
                height: h*0.85,
                width: w,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 220, 220, 220),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(borderRadius),
                    bottomRight: Radius.circular(borderRadius),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    /// 展示图片模块
                    Container(
                      height: h*0.4,
                      width: w,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.white,
                      child: Text(
                        'majicaカード番号登録いただいた方のみ、majicaアプリの全てのサービスが利用できます。',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 5,
                      ),
                    ),
                    /// 选择下次不表示按钮模块
                    Container(
                      height: h*0.2,
                      width: w,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0,left: 20.0),
                      color: Colors.white,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: (h*0.2-20.0)/2,
                            right: 0.0,
                            height: 20.0,
                            width: 20.0,
                            child: Container(
                              child: Image.asset('images/rightCircle.png'),
                            ),
                          ),
                          Positioned(
                            right: 25.0,
                            top: (h*0.2-25.0)/2,
                            height: 25.0,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '詳しく見る',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(255, 255, 215, 0)
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 255, 215, 0),
                                    width: 1.0
                                  )
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    /// 商品检索按钮模块
                    Container(
                      height: h*0.25,
                      width: w,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            bottomRight: Radius.circular(borderRadius),
                          ),
                        color: Color.fromARGB(255, 245, 245, 245),
                      ),
                      child: Container(
                        height: h*0.2,
                        color: Colors.white,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 10.0,
                          right: 20.0,
                          bottom: 10.0,
                        ),
                        child: GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 215, 0),
                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                            ),
                            child: Text(
                              'majicaカード番号登録',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromARGB(255, 255, 255, 224)
                              ),
                            ),
                          ),
                          onTap: () {
//                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}