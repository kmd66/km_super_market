import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:prj/pages/menus/menus.dart';
import 'core/Widget/textInput/textInputBorder.dart';
import 'core/abstract/baseNavigationWidget.dart';
import 'core/model/enums.dart';
import 'core/model/navigation.dart';
import 'helper/appNavigator.dart';
import 'helper/appPropertis.dart';
import 'helper/objectColor.dart';
import 'helper/textStyle.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


class MyApp extends StatefulWidget {
  static  AppNavigator navigator = AppNavigator();
  static  Menus menus = Menus();
  static  AppPropertis propertis = AppPropertis();

  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
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
              // scrollBehavior: MyCustomScrollBehavior(),
              // theme: ThemeData(fontFamily: 'IRANSansX'),
              debugShowCheckedModeBanner: false,
              navigatorKey: MyApp.navigator.navigatorKey,
              home: HomePage(),
            ),
            onWillPop: (){
              MyApp.navigator.pop();
              return Future.value(false);
            }),
        Container(height: 0, width: 0)
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Container(height: 100, width: 100,color: Colors.red,
        //     child: ElevatedButton(
        //       onPressed: () {
        //         MyApp.navigator.pop();
        //       },
        //       child: const Text('Go back!'),
        //     )
        //     ,),
        // )
      ],),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends BaseNavigationWidget<HomePage> {
  _HomePage() : super(ChengState(StateType.Main), RouteList.HomePage);
  String mobile='';
  @override
  Widget stateBuild(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: const Text('Open route'),
        onPressed: () {
          MyApp.navigator.push(RouteList.AboutPage);
        },
      ),
      ElevatedButton(
        onPressed: () {
          MyApp.navigator.pop();
        },
        child: const Text('Go back!'),
      ),
      new TextInputBorder('شماره همراه',maxLength: 11, textInputType: TextInputType.number,hintLabel:'شماره همراه خود را وارد کنید',modelLabel:'شماره همراه', model: mobile,onChange: (x)=> mobile = x,),
      new TextInputBorder('شماره همراه',enabled: false, textInputType: TextInputType.number,hintLabel:'شماره همراه خود را وارد کنید',modelLabel:'شماره همراه', model: 'kk'),

    ]);

  }

}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends BaseNavigationWidget<LoginPage> {
  _LoginPage() : super(ChengState(StateType.Main), RouteList.AboutPage);

  @override
  Widget stateBuild(BuildContext context) {
    return Container(
      child: Center(
          child: Column(children: [
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                MyApp.navigator.push(RouteList.HomePage);
              },
            ),
            ElevatedButton(
              onPressed: () {
                MyApp.navigator.pop();
              },
              child: const Text('Go back!'),
            ),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
          ],)
      ),
    );
  }
}

