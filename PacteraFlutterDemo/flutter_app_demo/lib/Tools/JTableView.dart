import 'package:flutter/material.dart';

typedef SectionSpread = bool Function(int index);
typedef SectionBuilder = Widget Function(BuildContext context, Indexpath indexPath);
typedef RowCount = int Function(int index);
typedef RowBuilder = Widget Function(BuildContext context, Indexpath indexPath);
typedef Refresh = Function();
typedef Load = Function();

bool updateItems = true;
List<Item> items;
class JTableView extends StatefulWidget {

  double height;/// 高度
  double width;/// 宽度
  int sectionCount;/// 设置组的数量
  SectionSpread sectionSpread;/// 设置组是否展开
  SectionBuilder sectionBuilder;/// 设置组头对应的视图
  RowCount rowCount;/// 设置列的数量
  RowBuilder rowBuilder;/// 设置列对应的视图
  Refresh refresh;/// 下拉刷新回调
  Load load;/// 上拉加载回调

  JTableView({Key key,
    this.height,
    this.width,
    this.sectionCount,
    this.sectionSpread,
    this.sectionBuilder,
    this.rowCount,
    this.rowBuilder,
    this.refresh,
    this.load,
  });

  static JTableViewState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<JTableViewState>());
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JTableViewState();
  }
}

class JTableViewState extends State<JTableView> {
  ScrollController controller = ScrollController();
  double offset = 0.0;/// 当前偏移量
  double maxOffset = 0.0;/// 最大偏移量

  /// 下拉刷新模块属性
  bool show_refresh = false;/// 是否展示下拉刷新控件
  double refresh_top = 0.0;/// 下拉刷新控件top值
  double refresh_h = 50.0;/// 下拉刷新控件高度
  bool refresh = false;/// 是否正在刷新

  /// 上拉加载模块属性
  bool show_load = false;/// 是否展示上拉加载控件
  double load_h = 50.0;/// 上拉加载控件高度
  bool load = false;/// 是否正在加载

  @override
  void initState() {
    super.initState();
    /// 更新item数组
    if (updateItems) {
      _reloadItems();
      updateItems = false;
    }
    /// 初始化刷新控件数据
    show_refresh = widget.refresh != null;
    refresh_top = -refresh_h;
    show_load = widget.refresh != null;
  }

  /// 更新子控件组列布局排布数组(只调用一次，除非更新数据)
  _reloadItems() {
    items = List();
    int section = 0;
    int row = -1;
    int sections = widget.sectionCount != null ? widget.sectionCount : 0;
    for (int i = 0; i<sections; i++) {
      Indexpath sectionIndexpath = Indexpath(section: section,row: row);
      Item item = Item(indexpath: sectionIndexpath);
      item.height = 0.0;
      items.add(item);
      int rows = widget.rowCount != null ? widget.rowCount(i) : 0;
      for (int j = 0; j<rows; j++) {
        row++;
        Indexpath rowIndexPath = Indexpath(section: section,row: row);
        Item item = Item(indexpath: rowIndexPath);
        item.height = 0.0;
        items.add(item);
      }
      row = -1;
      section++;
    }
  }

  /// 更新指定item的高度
  reloadItemHeight(int index, GlobalKey key) async {
    await Future.delayed(Duration(milliseconds: 1), (){
      if (items[index].height == 0.0) {
        items[index].height = key.currentContext.size.height;
      }
    });
  }

  /// 滚动到指定item
  scrollToIndexPath(Indexpath indexPath) {
    /// 判断传入的值是否正确
    assert(indexPath.section < widget.sectionCount||indexPath.section<0,'section赋值错误');
    int rows = widget.rowCount(indexPath.section);
    assert(indexPath.row < rows||indexPath.row<-1,'row赋值错误');
    /// 计算滚动高度
    double offset = 0.0;
    for (int i=0; i<items.length; i++) {
      Indexpath current = items[i].indexpath;
      bool sectionSpread = widget.sectionSpread != null ? widget.sectionSpread(items[i].indexpath.section) : true;
      if (current.section == indexPath.section&&current.row == indexPath.row) {
        break;
      }
      if (current.row != -1) {
        if (!sectionSpread) {
          continue;
        }
      }
      offset += items[i].height;
    }
    controller.animateTo(offset, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  /// 删除指定item
  delectIndexPath(Indexpath indexPath) {
    items.map((item) {
      if (item.indexpath.section == indexPath.section&&item.indexpath.row == indexPath.row) {
        setState(() {
          items.remove(item);
        });
      }
    }).toList();
  }

  /// 刷新指定item数据
  reloadIndexpath(Indexpath indexpath) {
    for (int i=0; i<items.length; i++) {
      if (items[i].indexpath.section == indexpath.section&&items[i].indexpath.row == indexpath.row) {
        setState(() {
          items[i] = Item(indexpath: indexpath, height: 0.0);
        });
      }
    }
  }

  /// 整体刷新数据
  reload() {
    setState(() {
      updateItems = true;
      if (items.length > 0) {
        items.clear();
      }
    });
  }

  /// 结束下拉刷新更新
  endRefresh() {
    setState(() {
      refresh = false;
    });
  }

  /// 结束上拉加载更新
  endLoad() {
    setState(() {
      load = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notify) {
        setState(() {
          maxOffset = notify.metrics.maxScrollExtent;
          offset = notify.metrics.pixels;
        });
        if (notify is ScrollUpdateNotification) {
          if (offset <= 0) {
            refresh_top -= notify.scrollDelta;
            if (refresh_top <= -50.0) {
              refresh_top = -50.0;
            }
          }
          if (notify.dragDetails == null) {
            if (offset<=-refresh_h && refresh == false && show_refresh) {
              /// 下拉刷新
              controller.jumpTo(0.0);
              refresh = true;
              widget.refresh();
            }else if (offset >= maxOffset+load_h && load == false && show_load) {
              /// 上拉加载
              load = true;
              widget.load();
            }
          }
        }
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Positioned(
              top: refresh ? 0.0 : refresh_top,
              left: 0.0,
              right: 0.0,
              height: refresh_h,
              child: widget.refresh != null ? Container(color: Colors.deepOrange) : Container(color: Colors.yellow),
            ),
            Positioned(
              top: refresh ? refresh_h : 0.0,
              left: 0.0,
              bottom: load ? load_h : 0.0,
              right: 0.0,
              child: Container(
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: controller,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Widget item;
                    if (items[index].indexpath.row == -1) {
                      item = widget.sectionBuilder != null ? widget.sectionBuilder(context, items[index].indexpath) : null;
                    } else {
                      bool sectionSpread = widget.sectionSpread != null ? widget.sectionSpread(items[index].indexpath.section) : true;
                      if (sectionSpread) {
                        item = widget.rowBuilder != null ? widget.rowBuilder(context, items[index].indexpath) : null;
                      }
                    }
                    GlobalKey key = GlobalKey();
                    Container container = Container(key: key, child: item);
                    reloadItemHeight(index, key);
                    return container;
                  },
                ),
              ),
            ),
            Positioned(
              top: load ? widget.height-load_h : (offset >= maxOffset ? widget.height-offset+maxOffset : widget.height),
              left: 0.0,
              right: 0.0,
              height: load_h,
              child: widget.refresh != null ? JTableViewRefresh() : Container(color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}

/// item布局位置
class Indexpath {
  int section;
  int row;

  Indexpath({Key key,
    this.section,
    this.row,
  });
}

/// 本地存储item数据
class Item {
  Indexpath indexpath;
  double height;
  Item({Key key,
    this.indexpath,
    this.height,
  });
}


enum JTableViewRefreshType {
  up,
  down,
  start
}
class JTableViewRefresh extends StatefulWidget {
  double offset = 0.0;
  JTableViewRefresh({Key key,
    this.offset,
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JTableViewRefreshState();
  }
}
class JTableViewRefreshState extends State<JTableViewRefresh> {
  JTableViewRefreshType type = JTableViewRefreshType.up;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String img_str = '';
    String title_str = '';
    switch (type) {
      case JTableViewRefreshType.up:
        img_str = 'up.png';
        title_str = '下拉刷新数据';
        break;
      case JTableViewRefreshType.down:
        img_str = 'down.png';
        title_str = '松手刷新数据';
        break;
      case JTableViewRefreshType.start:
        img_str = 'reload.png';
        title_str = '正在刷新数据';
        break;
    }
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      child: Container(
        height: 30.0,
        width: 100.0,
        color: Colors.brown,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 20.0,
              width: 20.0,
              alignment: Alignment.center,
              child: Image.asset(img_str),
            ),
            Container(
              height: 20.0,
              width: 80.0,
              alignment: Alignment.center,
              child: Text(
                title_str,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
