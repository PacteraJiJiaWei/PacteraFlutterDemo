import 'package:flutter/material.dart';

/// item类型
enum JMainTabbarItemType {
  nomal,/// 图片加文字
  image,/// 只有图片
  boost,/// 只有图片且放大图片
}

/// tabbar_item的点击回调
typedef JMainTabbarItemBlock();

class JMainTabbarItem extends StatelessWidget {
  bool selected;
  JMainTabbarItemBlock onTap;
  JmainTabbarItemBean bean;

  JMainTabbarItem({Key key,
    this.onTap,
    this.selected,
    this.bean,
  });

  /// 正常形式item
  Widget nomalItem() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: Image.asset(
                selected ? bean.selectImg : bean.nomalImg,
                height: 25.0,
                width: 25.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 3.0,top: 3.0),
              child: Text(
                bean.title,
                style: TextStyle(
                  color: selected ? bean.selectColor : bean.nomalColor,
                  fontSize: bean.titleFont,
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }

  /// 只有图片item
  Widget imageItem() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          child: Image.asset(
            selected ? bean.selectImg : bean.nomalImg,
            height: selected ? 45.0 : 25.0,
            width: selected ? 45.0 : 25.0,
          ),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }

  /// 放大图片item
  Widget boostItem() {
    return Positioned.fill(
      top: -20.0,
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 5.0),
          child: Image.asset(
            selected ? bean.selectImg : bean.nomalImg,
            height: 100.0,
            width: 100.0,
          ),
        ),
        onTap: () {
          onTap();
        },
      )
    );
  }

  Widget getItem() {
    if (bean.type == JMainTabbarItemType.boost) {
      return boostItem();
    } else if (bean.type == JMainTabbarItemType.image) {
      return imageItem();
    } else {
      return nomalItem();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          getItem()
        ],
      ),
    );
  }
}

class JmainTabbarItemBean {
  String title;
  double titleFont;
  Color nomalColor;
  Color selectColor;
  String nomalImg;
  String selectImg;
  JMainTabbarItemType type;
  Widget controller;

  JmainTabbarItemBean({Key key,
    this.title,
    this.titleFont,
    this.nomalColor,
    this.selectColor,
    this.nomalImg,
    this.selectImg,
    this.type,
    this.controller,
  });
}