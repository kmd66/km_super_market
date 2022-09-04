import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/main/myApp.dart';
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
    super.initState();
  }

  @protected
  @mustCallSuper
  void close(){
    if(MyApp.navigator.isMenu){
      MyApp.events.streamMenu.add(MenuList.hide);
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
    return Directionality(textDirection: TextDirection.rtl,
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
        );

  }

}

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidget createState() => _MenuWidget();
}

class _MenuWidget extends State<MenuWidget> {

  Widget child =Container(height: 0,width: 0,);

  @override
  void initState() {
    initStream();
    super.initState();
  }

  void  initStream(){
    if( MyApp.events.streamMenu.hasListener == true)
      MyApp.events.streamMenu.close();
    MyApp.events.streamMenu = StreamController<MenuList>();
    MyApp.events.streamMenu.stream.listen((v){
      setState(() {
        child = MyApp.navigator.getMenu(v);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
