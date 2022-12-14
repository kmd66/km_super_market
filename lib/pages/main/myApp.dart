import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/Widget/loading.dart';
import '../../core/abstract/baseMenuWidget.dart';
import '../../core/model/enums.dart';
import '../../helper/AppNavigator.dart';
import '../../helper/appPropertis.dart';
import '../../helper/myCustomScrollBehavior.dart';
import '../../helper/objectColor.dart';
import '../../helper/events.dart';
import '../login/login.dart';
import '../menus/menus.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  static AppNavigator navigator = AppNavigator();
  static AppPropertis propertis = AppPropertis();
  static Menus menus = Menus();
  static Events events =Events();
  static ObjectColor color = ObjectColor();

  static _MyApp state = new _MyApp();
  @override
  _MyApp createState(){
    MyApp.state = new _MyApp();
    return MyApp.state;
  }
}

class _MyApp extends State<MyApp> {
  var _getData = false;

  Future<void>  getData() async{
    SharedPreferences local = await SharedPreferences.getInstance();
    if(local.containsKey('accessToken') && local.containsKey('currentUser')){
      MyApp.propertis.accessToken = jsonDecode(local.getString('accessToken')!);
      MyApp.propertis.currentUser = jsonDecode(local.getString('currentUser')!);
    }
    if(local.containsKey('nightType'))
      MyApp.color.nightType = NightType.values.enumFromString(local.getString('nightType')!);
    if(local.containsKey('colerType'))
      MyApp.color.colerType = ColerType.values.enumFromString(local.getString('colerType')!);
    if(local.containsKey('colerLinkType'))
      MyApp.color.colerLinkType = ColerType.values.enumFromString(local.getString('colerLinkType')!);
    _getData= true;
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await getData();
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
    loginController();
    setState(() {});
  }

  void loginController() async{
    if(MyApp.events.loginController.hasListener)
      MyApp.events.loginController.close();
    MyApp.events.loginController = StreamController<LoginType>();
    MyApp.events.loginController.stream.listen((value){
      login(value);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Stack(children: [
        WillPopScope(
            child:MaterialApp(
              scrollBehavior: MyCustomScrollBehavior(),
              theme: ThemeData(fontFamily: 'IRANSansX'),
              debugShowCheckedModeBanner: false,
              navigatorKey: MyApp.navigator.navigatorKey,
              home: view(context),
            ),
            onWillPop: (){
              MyApp.navigator.pop();
              return Future.value(false);
            }),
        MenuWidget(),
        LoadinWidget(),
      ],),
    );
  }

  Widget view(BuildContext context) {
    if(_getData) {
      if(MyApp.propertis.accessToken != null)
        return MyApp.navigator.getView(RouteList.HomePage, MyApp.navigator.mainObjKey);
      else return new LoginPage(MyApp.navigator.mainObjKey);
    }
    else return new Container(height: 0, width: 0);
  }

  Future<void>  login(value) async{
    Widget ? builderView;
    if(value == LoginType.Exit) {
      SharedPreferences local = await SharedPreferences.getInstance();
      if(local.containsKey('accessToken'))
        await local.remove("accessToken");
      if(local.containsKey('currentUser'))
        await local.remove("currentUser");

      MyApp.propertis.accessToken = null;
      MyApp.propertis.currentUser = null;
      builderView = new LoginPage(MyApp.navigator.mainObjKey);
    }
    MyApp.navigator.resetHistory(builderView:builderView);
  }
}