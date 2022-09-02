import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/AppNavigator.dart';
import '../../helper/objectColor.dart';
import '../../helper/textStyle.dart';
import '../../main.dart';
import '../Widget/getTop.dart';
import '../model/enums.dart';

abstract class BaseStateWidget<T extends StatefulWidget> extends State<T> {
  BaseStateWidget({this.title });
  final String? title;
  final _scrollController = ScrollController();
  GetTop? getTop;
  @override
  void initState() {
    getTop = GetTop(scrollController: _scrollController);
    scroll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Stack(children: [
      Scaffold(
        backgroundColor: MyApp.color.baseBackground,
        appBar:_appBar(context),
        body: _body(context),
        bottomNavigationBar:_navigationBar(context), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    ])
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        backgroundColor: MyApp.color.base,
        shadowColor:Colors.transparent,
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title:   Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),child: Text('title??AppNavigator.routeTitle', style: Style.h4(color: white)),)
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => MyApp.navigator.pop(),
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ]
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Scrollbar(
          // isAlwaysShown: true,
          controller: _scrollController, // <---- Here, the controller
          child:RawScrollbar(
            controller: _scrollController,
            thumbColor:MyApp.color.shadowBackground(.6),
            radius: Radius.circular(20),
            thickness: 5,
            child:
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _scrollController, // <---- Same as the Scrollbar controller
                child:
                Center(
                  child:
                  Container(
                      decoration: BoxDecoration(
                        color: MyApp.color.baseBackground,
                      ),
                      child:stateBuild(context)
                  ),
                )
            ),
          ),
        ),
        getTop!,
      ],
    );
  }

  @protected
  Widget stateBuild(BuildContext context);

  Widget _navigationBar(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left : 14.0,bottom: 14.0,right: 14.0,top: 5.0),
        decoration: BoxDecoration(
          color: MyApp.color.base,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:
        InkWell(
            onTap: (){
              MyApp.navigator.pop();
            },
            child:
            Container(
              height: 60,
              child:Center(child: Text('بازگشت',style:Style.h4(color: white)),)
              ,
            )
        )
    );
  }

  void scroll() {
    _scrollController.addListener(() {
      getTop?.scroll(_scrollController.position.pixels);
    });
  }
}