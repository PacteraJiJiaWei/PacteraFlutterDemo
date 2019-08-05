import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Home/Setup.dart';
import 'package:flutter_app_demo/Tools/JFrame.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageState();
  }
}

class MessageState extends State<Message> {

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
                    width: 20.0,
                    child: GestureDetector(
                      child: Container(
                        child: Image.asset('images/leftImage.png',fit: BoxFit.fill,),
                      ),
                      onTap: () {
                        Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(
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
                        'お得情报',
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
          color: Colors.white,
          child: ListView.builder(
            itemCount: 15
            ,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                  bottom: 5.0,
                ),
                child: Container(
                  height: 430.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 10.0,
                        spreadRadius: 1.0
                      )
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 40,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          )
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              alignment: Alignment.centerLeft,
                              height: 30.0,
                              width: (width-40.0)/2,
                              child: Container(
                                alignment: Alignment.center,
                                color: Color.fromARGB(255, 201, 24, 45),
                                width: 50.0,
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 30.0,
                              width: (width-40.0)/2,
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 28.0,
                                width: 100.0,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                                  color: Colors.green,
                                ),
                                child: Text('工工'),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 15.0,
                          top: 5.0,
                          right: 15.0,
                        ),
                        height: 300.0,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.all(15.0),
                          height: 50.0,
                          width: width-70.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Text(
                            '详情',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                            ),
                          ),
                        ),
                        onTap: () {
                          print('点击了详情');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}