import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../core/Widget/loading.dart';
import '../../helper/AppNavigator.dart';
import '../../helper/appPropertis.dart';
import '../../helper/myCustomScrollBehavior.dart';
import '../../helper/objectColor.dart';
import '../../helper/events.dart';
import '../../main.dart';
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
    navigator.menuCallback= (menuWidget){
      state.setState(()=>state.menu = menuWidget);
    };
    return MyApp.state;
  }
}


class _MyApp extends State<MyApp> {

  Widget menu = Container(height: 0, width: 0);

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
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
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
              home: HomePage(),
            ),
            onWillPop: (){
              MyApp.navigator.pop();
              return Future.value(false);
            }),
        menu,
        LoadinWidget(),
      ],),
    );
  }
}