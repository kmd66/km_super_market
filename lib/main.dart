import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/abstract/baseNavigationWidget.dart';
import 'core/model/enums.dart';
import 'helper/appNavigator.dart';
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          backgroundColor: ObjectColor.base,
          shadowColor:Colors.transparent,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title:   Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),child: Text('First Route', style: Style.h4(color: white)),)
            ],
          ),
          actions: [
            IconButton(
              onPressed: () => MyApp.navigator.pop(),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ]
      ),
      body: Center(
          child:Column(children: [
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
            )
          ])
      ),
    );

  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage('Setting');
}

class _LoginPage extends BaseNavigationWidget<LoginPage> {
  _LoginPage(String appBarTitle)
      : super(title:appBarTitle);

  @override
  Widget stateBuild(BuildContext context) {
    return Container(
      color: Colors.red,
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

