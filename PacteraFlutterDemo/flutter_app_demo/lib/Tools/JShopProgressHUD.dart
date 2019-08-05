import 'package:flutter/material.dart';

class JShopProgressHUD extends Dialog {
  double left_magin = 20.0;
  double scale = 1.5;
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
              Container(
                alignment: Alignment.center,
                height: h*0.1,
                width: w,
                child: Text(
                  '案内',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
              /// 白色区域
              Container(
                height: h*0.9,
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
                      height: h*0.65,
                      width: w,
                      alignment: Alignment.topCenter,
                    ),
                    /// 选择下次不表示按钮模块
                    Container(
                      height: h*0.1,
                      width: w,
                      alignment: Alignment.center,
                      child: ShopSelect(height: h*0.1,select: select,),
                    ),
                    /// 商品检索按钮模块
                    Container(
                      height: h*0.15,
                      width: w,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(borderRadius),
                          bottomRight: Radius.circular(borderRadius),
                        )
                      ),
                      child: GestureDetector(
                        child: Container(
                          height: h*0.1,
                          width: w-40.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                          ),
                          child: Text(
                            '商品检索',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
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

/// 选择器
class ShopSelect extends StatefulWidget {
  double height;
  bool select;
  ShopSelect({Key key,
    this.height,
    this.select,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShopSelectState();
  }
}

class ShopSelectState extends State<ShopSelect> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        GestureDetector(
          child: Container(
            width: widget.height-28.0,
            height: widget.height-28.0,
            margin: const EdgeInsets.only(left: 20.0),
            child: Image.asset(widget.select ? 'images/select.png' : 'images/noSelect.png'),
          ),
          onTap: () {
            setState(() {
              widget.select = !widget.select;
            });
          },
        ),
        Container(
          margin: const EdgeInsets.only(left: 10.0,right: 20.0),
          alignment: Alignment.center,
          child: Text(
            '下次不再提示',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black
            ),
          ),
        )
      ],
    );
  }
}