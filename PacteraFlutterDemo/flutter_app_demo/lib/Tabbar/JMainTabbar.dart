import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Tabbar/JMainTabbarItem.dart';

/// tabbar选中item回调
typedef JMainTabbarBlock(int index);

class JMainTabbar extends StatefulWidget {
  var currentIndex = 0;
  JMainTabbarBlock onTap;
  List<JmainTabbarItemBean> items;
  JMainTabbar({Key key, this.items,this.currentIndex,this.onTap});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JMainTabbarState();
  }
}

class JMainTabbarState extends State<JMainTabbar> {
  List<int> indexs;

  getIndexs() {
    indexs = List();
    for (int i=0; i<widget.items.length; i++) {
      indexs.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    getIndexs();
    // TODO: implement build
    return Stack(
        alignment: Alignment.bottomCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
              height: 49.0,
              color: Color.fromARGB(255, 201, 24, 45),
              child: Row(
                children: indexs.map( (int index) {
                  return JMainTabbarItem(
                    onTap: () {
                      setState(() {
                        widget.currentIndex = index;
                        widget.onTap(index);
                      });
                    },
                    selected: widget.currentIndex == index,
                    bean: widget.items[index],
                  );
                }).toList(),
              )
          )
        ],
    );
  }
}



