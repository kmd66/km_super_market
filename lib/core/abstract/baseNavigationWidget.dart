import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/AppNavigator.dart';
import '../../helper/objectColor.dart';
import '../../main.dart';
import '../Widget/getTopo.dart';
import '../model/enums.dart';
import '../model/navigation.dart';
import 'appBarWidget.dart';
import 'bodyWidget.dart';
import 'navigationBarWidget.dart';

abstract class BaseNavigationWidget<T extends StatefulWidget> extends State<T> {
  BaseNavigationWidget(this.chengState, this.route, {this.title});
  final String? title;
  final ScrollController _scrollController = ScrollController();

  late GetTopo? getTopo;
  final AppBarWidget appBar = AppBarWidget();
  late NavigationBarWidget navigationBarWidget;

  ChengState chengState;
  bool navigationsAdd = true;
  final StreamController<ChengState> streamChengState  = StreamController<ChengState>();
  final RouteList route ;

  StateType get stateType => chengState.stateType;
  set stateType (StateType x) => chengState.stateType = x;

  @protected
  @mustCallSuper
  void initState() {

    navigationsAdd = false;
    changeState(chengState);
    navigationsAdd = true;

    if(streamChengState.hasListener != true) {
      streamChengState.stream.listen((value) {
        changeState(value);
      });
    }
    navigationBarWidget =  NavigationBarWidget(scrollController: _scrollController);
    getTopo = GetTopo(scrollController: _scrollController);

    scroll();
    super.initState();
  }

  @protected
  @mustCallSuper
  void dispose() {
    if(streamChengState.hasListener == true)
      streamChengState.close();
    super.dispose();
  }

  @protected
  @mustCallSuper
  void changeState(ChengState value){

    // if(value.streamDialogHide) {
    //   streamDialog.add(null);
    // }

    if(value.stateType != null && stateType != null && value.stateType == StateType.None) {
      value.navigationsAdd = false;
      value.getList = false;
      value.stateType = stateType;
    }

    if(value.navigationsAdd == false)
      navigationsAdd = false;
    if (value.scrollJump && !_scrollController.positions.isEmpty)
      _scrollController.jumpTo(0.0);

    // if(navigationsAdd && stateType != value.stateType) {
    //   AppPropertis.navigations.add(
    //       new Navigation(route: route, chengState: value));
    // }
    else navigationsAdd = true;

    stateType = value.stateType;
  }

  // build
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Stack(children: [
      Scaffold(
        backgroundColor: MyApp.color.baseBackground,
        appBar: appBar.build(context),
        body: BodyWidget(
          child: stateBuild(context),
          scrollController: _scrollController,
          getTopo: getTopo,
        ),
        bottomNavigationBar:navigationBarWidget, // This trailing comma makes auto-formatting nicer for build methods.
      ),
    ])
    );
  }


  @protected
  Widget stateBuild(BuildContext context);

  void scroll() {
    _scrollController.addListener(() {
      getTopo?.scroll(_scrollController.position.pixels);
    });
  }
}

class AboutPage extends StatefulWidget {
  @override
  _AboutPage createState() => _AboutPage();
}

class _AboutPage extends BaseNavigationWidget<AboutPage> {
  _AboutPage() : super(ChengState(StateType.Main), RouteList.AboutPage);

  @override
  Widget stateBuild(BuildContext context) {
    return Center(
        child: Column(children: [
          ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              MyApp.navigator.push(RouteList.LoginPage);
            },
          ),
          ElevatedButton(
            onPressed: () {
              MyApp.navigator.pop();
            },
            child: const Text('Go back!'),
          ),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
        ],)
    );
  }
}