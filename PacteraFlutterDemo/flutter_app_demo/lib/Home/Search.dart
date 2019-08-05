import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Tools/JShopProgressHUD.dart';
import 'package:flutter_app_demo/Home/Setup.dart';
import 'package:flutter_app_demo/Tools/JFrame.dart';

class Search extends StatefulWidget {
  String title;
  bool isFirst = true;
  Search({Key key,
    this.title
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchState();
  }
}

class SearchState extends State<Search> {

  /// 展示提示用户的HUD
  showHUD(BuildContext context, bool first) async{
    if (widget.isFirst) {
      await new Future.delayed(const Duration(seconds: 0), () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return JShopProgressHUD();
            }
        );
      });
      widget.isFirst = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    double width = BaseFrame.safeWidth();

    showHUD(context, widget.isFirst);
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
                    top: 15.0,
                    left: 40.0,
                    height: 24.0,
                    width: 24.0,
                    child: GestureDetector(
                      child: Container(
                        child: Image.asset('images/back.png',fit: BoxFit.fill,),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
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
                        '商品检索',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                  bottom: 5.0,
                ),
                child: Container(
                  color: Color.fromARGB(255, 201, 24, 45),
                  height: 300.0,
                ),
              );
            },
          ),
        )
      ),
    );
  }
}