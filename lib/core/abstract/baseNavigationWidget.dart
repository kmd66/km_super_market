import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/main/myApp.dart';
import '../Widget/getTop.dart';
import '../model/enums.dart';
import '../model/navigation.dart';
import 'appBarWidget.dart';
import 'bodyWidget.dart';
import 'navigationBarWidget.dart';

abstract class BaseStatefulWidget<T> extends StatefulWidget {
  BaseStatefulWidget(this.navigatorKey) :  super(key: navigatorKey);
  T? state ;

  final GlobalKey<NavigatorState> navigatorKey;
}

abstract class BaseNavigationWidget<BaseStatefulWidget extends StatefulWidget> extends State<BaseStatefulWidget>{
  BaseNavigationWidget(this.chengState, this.route, {Key? key, this.title});
  final String? title;
  final ScrollController _scrollController = ScrollController();

  late GetTop? getTop = GetTop(scrollController: _scrollController);
  final AppBarWidget appBar = AppBarWidget();
  late NavigationBarWidget navigationBarWidget=  NavigationBarWidget(scrollController: _scrollController);

  ChengState chengState;
  final StreamController<ChengState> streamChengState  = StreamController<ChengState>();
  final RouteList route ;

  StateType get stateType => chengState.stateType;
  set stateType (StateType x) => chengState.stateType = x;

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @protected
  @mustCallSuper
  void initState() {
    changeState(chengState);
    if(streamChengState.hasListener != true) {
      streamChengState.stream.listen((value) {
        changeState(value);
      });
    }

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
    if(value.stateType != null && stateType != null && value.stateType == StateType.None) {
      value.getList = false;
      value.stateType = stateType;
    }

    if (value.scrollJump && !_scrollController.positions.isEmpty)
      _scrollController.jumpTo(0.0);

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
              getTop: getTop,
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
      getTop?.scroll(_scrollController.position.pixels);
    });
  }
}

class AboutPage extends BaseStatefulWidget<_AboutPage> {
  AboutPage(GlobalKey<NavigatorState> key) : super(key);

  @override
  _AboutPage createState(){
    state = _AboutPage();
    return state!;
  }
}

class _AboutPage extends BaseNavigationWidget {
  _AboutPage() : super(ChengState(StateType.Main), RouteList.AboutPage);

  @override
  Widget stateBuild(BuildContext context) {
    return Center(
        child: Column(children: [
          ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              MyApp.navigator.push(route: RouteList.LoginPage);
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