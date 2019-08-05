import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Tools/JTableView.dart';

class page2 extends StatefulWidget {
  final title;
  JTableView tab;
  page2(this.title);

  List<bool> spreads = [true,true,true,true,true];

  List<List> data = [
    ["qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\neqeqweweqw\neqeqweweqw\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw","qweqeqe\neqeqweweqw\neqeqweweqw\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw",],
    ["qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\neqeqweweqw\neqeqweweqw\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw","qweqeqe\neqeqweweqw\neqeqweweqw\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw",],
    ["qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\neqeqweweqw\neqeqweweqw\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw","qweqeqe\neqeqweweqw\neqeqweweqw\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw",],
    ["qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\neqeqweweqw\neqeqweweqw\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw","qweqeqe\neqeqweweqw\neqeqweweqw\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw",],
    ["qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\neqeqweweqw\neqeqweweqw\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw","qweqeqe\neqeqweweqw\neqeqweweqw\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw","qweqeqe\neqeqeqe\nqweqeqeqe\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw\neqeqweweqw",],
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return page2State();
  }
}

class page2State extends State<page2> {

  double top = 0.0;

  scroll(Indexpath indexPath, BuildContext context) {
    JTableView.of(context).scrollToIndexPath(indexPath);
  }

  Widget creat(BuildContext context) {
    widget.tab = JTableView(
      width: 200.0,
      height: 400.0,
      sectionCount: widget.data.length,
      sectionSpread: (index) {
        return widget.spreads[index];
      },
      sectionBuilder: (context, indexPath) {
        return GestureDetector(
          child: Container(
            color: Colors.red,
            height: 30.0,
            margin: EdgeInsets.all(5.0),
            child: Text('section:${indexPath.section}'),
          ),
          onTap: () {
            setState(() {
              widget.spreads[indexPath.section] = !widget.spreads[indexPath.section];
              print(widget.spreads);
            });
          },
        );
      },
      rowCount: (index) {
        return widget.data[index].length;
      },
      rowBuilder: (context, indexPath) {
        if (indexPath.row%2 == 0) {
          return GestureDetector(
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.all(5.0),
              child: Text(widget.data[indexPath.section][indexPath.row]),
            ),
            onTap: () {
              scroll(indexPath, context);
            },
          );
        }
        return GestureDetector(
          child: Container(
            color: Colors.blue,
            margin: EdgeInsets.all(5.0),
            child: Text(widget.data[indexPath.section][indexPath.row]),
          ),
          onTap: () {
            scroll(indexPath, context);
          },
        );
      },
      refresh: ()async {
        print('xxxxxx');
        await Future.delayed(Duration(seconds: 3),() {
          JTableView.of(context).endRefresh();
        });
      },
      load: ()async {
        print('xxxxxx');
        await Future.delayed(Duration(seconds: 3),() {
          JTableView.of(context).endLoad();
        });
      },
    );
    return widget.tab;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}