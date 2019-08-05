import 'package:flutter/material.dart';
import 'dart:math';

typedef Widget JCustomListViewBuilder(BuildContext context, int index);
typedef String JCustomListViewCurrentTitle(double offset);
class JCustomListView extends StatefulWidget {
  double height;
  double width;
  double itemHeight;
  List<Map> titles = List();
  JCustomListViewBuilder item;
  JCustomListViewCurrentTitle currentTitle;
  ScrollController controller = ScrollController();
  JCustomListView({Key key,
    this.height,
    this.width,
    this.itemHeight,
    this.item,
    this.titles,
    this.currentTitle,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JCustomListViewState();
  }
}

class JCustomListViewState extends State<JCustomListView> {
  List<String> newTitles;
  String currentTitle = '';
  double currentOffset = 0.0;

  scrollToIndex(int index) {
    double offset = 0.0;
    for (int i = 0; i<index; i++) {
      offset += widget.titles[i].values.first*widget.itemHeight;
    }
    widget.controller.animateTo(offset, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  getNewTitles() {


    newTitles = List();
    widget.titles.map((title) {
      for (int i=0;i<title.values.first;i++) {
        newTitles.add(title.keys.first);
      }
    }).toList();
  }

  String getCurrentTitle(double offset) {
    int index = (offset/widget.itemHeight).floor();
    if (index < 0) {
      index = 0;
    }else if (index > newTitles.length-1) {
      index = newTitles.length-1;
    }
    return newTitles[index];
  }

  @override
  Widget build(BuildContext context) {
    /// 先获取item数量
    getNewTitles();
    if (newTitles.length > 0 && currentOffset == 0.0) {
      currentTitle = newTitles.first;
    }

    // TODO: implement build
    return Container(
      height: widget.height,
      width: widget.width,
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                  width: 1.0
                ),
                top: BorderSide(
                    color: Colors.black12,
                    width: 1.0
                ),
              )
            ),
            child: ListView.builder(
              itemCount: widget.titles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    height: 50.0,
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      top: 5.0,
                      bottom: 5.0,
                      right: 5.0
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: widget.titles[index].keys.first == currentTitle ? Colors.red : Colors.white,
                                width: 1.0
                            )
                        )
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.titles[index].keys.first,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: widget.titles[index].keys.first == currentTitle ? Colors.red : Colors.black45,
                      ),
                    ),
                  ),
                  onTap: () {
                    scrollToIndex(index);
                  },
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: widget.height-40.0,
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notify) {
                setState(() {
                  currentOffset = notify.metrics.pixels;
                  currentTitle = getCurrentTitle(currentOffset);
                });
              },
              child: ListView.builder(
                controller: widget.controller,
                itemCount: newTitles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: widget.itemHeight,
                      alignment: Alignment.center,
                      child: widget.item(context, index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}