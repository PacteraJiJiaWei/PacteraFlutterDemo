import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Tools/JFrame.dart';

class Setup extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SetupState();
  }
}

class SetupState extends State<Setup> {
  List<String> titles = ['店铺检索','店铺一览','情报变更','设定','FAQ','通知','契约','情报'];
  List<int> indexs = [];

  @override
  Widget build(BuildContext context) {
    double width = BaseFrame.safeWidth();

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
                        '设置',
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
        body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Container(
              height: 60.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 1.0,
                  ),
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: width-100.0,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    padding: const EdgeInsets.only(right: 20.0),
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'images/right.png',
                      height: 20.0,
                      width: 20.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}