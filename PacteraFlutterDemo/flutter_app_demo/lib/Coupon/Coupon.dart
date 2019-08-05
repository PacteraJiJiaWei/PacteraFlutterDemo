import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Home/Setup.dart';
import 'package:flutter_app_demo/Tools/JFrame.dart';
import 'package:flutter_app_demo/Tools/JCustomListView.dart';

class Coupon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CouponState();
  }
}

class CouponState extends State<Coupon> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  List<Map> datas = [
    {'title':'iphone6s 限定增量品 100枚','flags':['8折','直降500'],'price':'4000','maxNum':'10','num':'3','JAN':'490121463113111245566','start':'2019/07/13 00:00','end':'2019/07/25 00:00','url':'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4034507756,1382995888&fm=58'},
    {'title':'iphone6s plus 2016款全新手机','flags':['9折'],'price':'6000','maxNum':'5','num':'3','JAN':'490121412345464654651','start':'2019/07/16 00:00','end':'2019/07/30 00:00','url':''},
    {'title':'iphoneX 促销 直降1000元','flags':['直降1000'],'price':'6500','maxNum':'10','num':'1','JAN':'490121414258111245566','start':'2019/07/11 00:00','end':'2019/07/27 00:00','url':'https://paimgcdn.baidu.com/3EEF2BF1A0A08F5F?src=http%3A%2F%2Fms.bdimg.com%2Fdsp-image%2F1380495864.jpg&rz=urar_2_968_600&v=0'},
    {'title':'Mac pro 限定打折 先到先得','flags':['8折','直降1000'],'price':'14000','maxNum':'2','num':'1','JAN':'134581463114931245566','start':'2019/07/02 00:00','end':'2019/07/19 00:00','url':'https://ss0.baidu.com/73F1bjeh1BF3odCf/it/u=2611464351,3931110863&fm=85'},
    {'title':'Mac Air 2016款 全新 强烈推荐','flags':['6折','直降2000'],'price':'8000','maxNum':'10','num':'9','JAN':'135489463113111245566','start':'2019/07/05 00:00','end':'2019/07/25 00:00','url':''},
    {'title':'ipad mini 2019款 最新款mini 限定','flags':['9折','库存少'],'price':'4000','maxNum':'10','num':'6','JAN':'356481463113111245566','start':'2019/07/10 00:00','end':'2019/07/29 00:00','url':'https://paimgcdn.baidu.com/7C40AD4744DECEC5?src=http%3A%2F%2Fms.bdimg.com%2Fdsp-image%2F1387660589.jpg&rz=urar_2_968_600&v=0'},
    {'title':'ipad air 9折销售 限定前100名 强烈推荐','flags':['9折','直降500'],'price':'5000','maxNum':'5','num':'3','JAN':'365941463113111245566','start':'2019/07/09 00:00','end':'2019/07/26 00:00','url':''},
    {'title':'ipad 2013款','flags':['9.5折','直降50'],'price':'3000','maxNum':'11','num':'3','JAN':'695941463113111245566','start':'2019/06/09 00:00','end':'2019/07/23 00:00','url':''},
  ];

  @override
  Widget build(BuildContext context) {
    double width = BaseFrame.safeWidth();
    double height = BaseFrame.safeHeight()-56.0-49.0;

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
                    left: 120.0,
                    right: 120.0,
                    height: 34.0,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'クーポン',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 13.0,
                    right: 15.0,
                    height: 28.0,
                    width: 45.0,
                    child: GestureDetector(
                      child: Container(
                        child: Image.asset('images/coupon.png',fit: BoxFit.fill,),
                      ),
                      onTap: () {
                        print('点击了优惠券按钮');
                      },
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
              Container(
                height: 50.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                      width: 1.0
                    ),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10.0,
                      height: 30.0,
                      width: width-50.0,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '2019/06/24 15:39现在',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '全88件',
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black54
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 12.5,
                      right: 10.0,
                      height: 25.0,
                      width: 25.0,
                      child: Container(
                        child: Image.asset('images/problem.png'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50.0,
                color: Color.fromARGB(255, 245, 245, 245),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      height: 50.0,
                      width: 50.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ドン・キホーテ銀座本館',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              JCustomListView(
                height: height-100.0,
                width: width,
                itemHeight: 240.0,
                titles: [{'手机':3},{'笔记本电脑':2},{'平板电脑':3}],
                item: (context, index) {
                  Map data = datas[index];
                  List<String> flags = data['flags'];
                  return Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Stack(
                        children: <Widget>[
                          /// 底层灰色
                          Positioned(
                            top: 5.0,
                            left: 5.0,
                            right: 5.0,
                            bottom: 5.0,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        ),
                                        child: Stack(
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                /// 标题
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 5.0,
                                                      top: 10.0,
                                                      right: 20.0
                                                  ),
                                                  height: 20.0,
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    data['title'],
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.black87
                                                    ),
                                                  ),
                                                ),
                                                /// 优惠图标
                                                Container(
                                                  height: 20.0,
                                                  alignment: Alignment.centerLeft,
                                                  margin: const EdgeInsets.only(top: 5.0),
                                                  padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
                                                  child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: flags.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return Container(
                                                        padding: const EdgeInsets.only(left: 5.0, right: 5.0,),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                            color: Colors.red,
                                                            border: Border.all(
                                                                color: Colors.black26,
                                                                width: 1.0
                                                            )
                                                        ),
                                                        margin: const EdgeInsets.only(left: 5.0),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          flags[index],
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10.0,
                                                              fontWeight: FontWeight.w600
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                /// 价格
                                                Container(
                                                  height: 20.0,
                                                  margin: const EdgeInsets.only(left: 5.0,top: 5.0),
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    'クーポン価額：',
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black87
                                                    ),
                                                  ),
                                                ),
                                                /// 税
                                                Container(
                                                  height: 30.0,
                                                  alignment: Alignment.centerLeft,
                                                  margin: const EdgeInsets.only(left: 5.0),
                                                  child: RichText(
                                                    text: TextSpan(
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: data['price'],
                                                              style: TextStyle(
                                                                  color: Colors.red,
                                                                  fontSize: 25.0,
                                                                  fontWeight: FontWeight.w600
                                                              )
                                                          ),
                                                          TextSpan(
                                                              text: '円',
                                                              style: TextStyle(
                                                                  color: Colors.red,
                                                                  fontSize: 16.0,
                                                                  fontWeight: FontWeight.w600
                                                              )
                                                          ),
                                                          TextSpan(
                                                              text: '+税',
                                                              style: TextStyle(
                                                                  color: Colors.red,
                                                                  fontSize: 13.0
                                                              )
                                                          ),
                                                        ]
                                                    ),
                                                  ),
                                                ),
                                                /// 时间
                                                Container(
                                                  height: 20.0,
                                                  margin: const EdgeInsets.only(left: 5.0),
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    '先着限定：共${data['maxNum']}个(剩余${data['num']}个)',
                                                    style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.black87
                                                    ),
                                                  ),
                                                ),
                                                /// 优惠码
                                                Container(
                                                  height: 20.0,
                                                  margin: const EdgeInsets.only(left: 5.0,bottom: 5.0),
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    'クーポンJAN：${data['JAN']}',
                                                    style: TextStyle(
                                                        fontSize: 11.0,
                                                        color: Colors.black54
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            /// 商品图片
                                            Positioned(
                                                top: 35.0,
                                                right: 10.0,
                                                height: 90.0,
                                                width: 100.0,
                                                child: data['url'] == '' ? Image.asset('images/takePhoto.png'): Image.network(data['url'])
                                            ),
                                          ],
                                        ),
                                      ),
                                      /// 开始时间
                                      Container(
                                        height: 20.0,
                                        margin: const EdgeInsets.only(left: 5.0,top: 5.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '開始：${data['start']}',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      /// 结束时间
                                      Container(
                                        height: 20.0,
                                        margin: const EdgeInsets.only(left: 5.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '終了：${data['end']}',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 20.0,
                                  bottom: 10.0,
                                  height: 40.0,
                                  width: 40.0,
                                  child: Image.asset('images/messageDetail.png'),
                                )
                              ],
                            ),
                          ),
                          /// new icon
                          Positioned(
                            top: 5.0,
                            right: 5.0,
                            height: 50.0,
                            width: 50.0,
                            child: Image.asset('images/new.png'),
                          ),
                        ],
                      )
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}