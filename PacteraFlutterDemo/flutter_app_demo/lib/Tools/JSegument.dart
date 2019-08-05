import 'package:flutter/material.dart';

typedef JSegumentCallBack(int index);
class JSegument extends StatefulWidget {
  double height;
  double width;
  JSegumentCallBack black;
  List<JSegumentBean> beans;
  PageController controller = PageController(initialPage: 0);
  JSegument({Key key,
    this.height,
    this.width,
    this.beans,
    this.black,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JSegumentState();
  }
}

class JSegumentState extends State<JSegument> {
  List<int> indexs;
  int currentIndex = 0;
  bool click = false;

  getIndexs() {
    indexs = List();
    for (int i=0;i<widget.beans.length;i++) {
      indexs.add(i);
    }
  }

  selectIndex() async{
    if (click) {
      widget.controller.animateToPage(currentIndex, duration: Duration(milliseconds: 200), curve: Curves.ease);
      await Future.delayed(Duration(milliseconds: 200));
      click = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 获取角标数组
    getIndexs();
    /// 自动滚动
    selectIndex();

    // TODO: implement build
    return Container(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            child: Row(
              children: indexs.map((index) {
                JSegumentBean bean = widget.beans[index];
                return GestureDetector(
                  child: Container(
                    width: widget.width/indexs.length,
                    height: widget.height,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: currentIndex == index ? bean.selectColor : bean.nomalColor,
                            width: 2.0,
                          )
                      ),
                    ),
                    child: Text(
                      bean.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: currentIndex == index ? bean.selectColor : bean.nomalColor,
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      click = true;
                      currentIndex = index;
                      if (widget.black != null) {
                        widget.black(index);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            height: widget.height-50.0,
            child: PageView.builder(
              controller: widget.controller,
              itemCount: indexs.length,
              itemBuilder: (context, index) {
                return widget.beans[index].widget;
              },
              onPageChanged: (index) {
                if (!click) {
                  setState(() {
                    currentIndex = index;
                    if (widget.black != null) {
                      widget.black(index);
                    }
                  });
                }
              },
              pageSnapping: true,
            ),
          ),
        ],
      ),
    );
  }
}

class JSegumentBean {
  String title;
  Widget widget;
  Color nomalColor;
  Color selectColor;

  JSegumentBean({Key key,
    this.title,
    this.widget,
    this.nomalColor,
    this.selectColor
  });
}