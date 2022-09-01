import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/main.dart';

import '../../helper/events.dart';
import '../../helper/objectColor.dart';
import '../Widget/showObj.dart';
import '../model/enums.dart';

abstract class BaseMenuWidget<T extends StatefulWidget> extends State<T> {
  BaseMenuWidget(this.appBarTitle, this.visibleNavigationBar);
  final _scrollController = ScrollController();
  final String appBarTitle;
  final bool visibleNavigationBar;

  @protected
  Widget stateBuild(BuildContext context);

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }
  @protected
  @mustCallSuper
  void initState() {
    if( MyApp.events.streamClosePopupState.hasListener == true)
      MyApp.events.streamClosePopupState.close();
    MyApp.events.streamClosePopupState = StreamController<bool>();
    MyApp.events.streamClosePopupState.stream.listen((v){
      close();
    });
    super.initState();
  }

  @protected
  @mustCallSuper
  void close(){
    if( MyApp.events.streamClosePopupState.hasListener == true)
      MyApp.events.streamClosePopupState.close();
    if(MyApp.navigator.isMenu) {
      MyApp.navigator.isMenu = false;
      MyApp.navigator.setMenu(MenuList.hide);
    }
  }

  @protected
  @mustCallSuper
  void dispose() {
    close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShowObj(
        isShow:MyApp.navigator.isMenu ,
        obj: Directionality(textDirection: TextDirection.rtl,
            child:
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(10,0,0,0),
                ),
                child:
                Scaffold(
                    backgroundColor: MyApp.color.baseBackground,
                    appBar:AppBar(
                      centerTitle: true,
                      backgroundColor: MyApp.color.base,
                      shadowColor:Colors.transparent,
                      title: Text(appBarTitle),
                    ),
                    body: Scrollbar(
                      controller: _scrollController, // <---- Here, the controller
                      child:
                      SingleChildScrollView(
                          controller: _scrollController, // <---- Same as the Scrollbar controller
                          child:stateBuild(context)
                      ),
                    ),
                    bottomNavigationBar:
                    visibleNavigationBar? Container(
                      margin: const EdgeInsets.all(10.0),
                      child:
                      FloatingActionButton(
                        child: Icon(
                          Icons.close,
                          color: MyApp.color.baseIcon,
                        ),
                        backgroundColor: MyApp.color.base,
                        onPressed:()=>close(),
                      ),
                    )
                        :Container(width: 0,height: 0,)
                )
            )
        )
    );

  }

}