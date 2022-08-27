import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'helper/AppNavigator.dart';

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
              navigatorKey: AppNavigator.navigatorKey,
              home: FirstRoute(),
            ),
            onWillPop: (){
              print('Future.value(false)');
              AppNavigator.pop(context);
              return Future.value(false);
            }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(height: 100, width: 100,color: Colors.red,
            child: ElevatedButton(
              onPressed: () {
                AppNavigator.pop(context);
              },
              child: const Text('Go back!'),
            )
            ,),
        )
      ],),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
          child:Column(children: [
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                AppNavigator.push(
                    context,
                    SecondRoute()
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                AppNavigator.pop(context);
              },
              child: const Text('Go back!'),
            )
          ])
      ),
    );

  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
          ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              AppNavigator.push(
                  context,FirstRoute()
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              AppNavigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],)
    );
  }
}

