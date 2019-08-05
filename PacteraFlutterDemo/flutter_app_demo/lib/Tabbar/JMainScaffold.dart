import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Tabbar/JMainTabbar.dart';
import 'package:flutter_app_demo/Tabbar/JMainTabbarItem.dart';
import 'package:flutter/rendering.dart';

class JMainScaffold extends StatefulWidget {
  var currentIndex = 0;
  List<JmainTabbarItemBean> items;

  JMainScaffold({Key key,
    this.currentIndex,
    this.items
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return JMainScaffoldState();
  }
}

class JMainScaffoldState extends State<JMainScaffold> {

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    // TODO: implement build
    return MaterialApp(
      title: 'new_demo',
      home: SafeArea(
        child: Scaffold(
          body: widget.items[widget.currentIndex].controller,
          bottomNavigationBar: JMainTabbar(
            currentIndex: widget.currentIndex,
            items: widget.items,
            onTap: (index) {
              setState(() {
                widget.currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}