import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
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
      home:Stack(children: [
        WillPopScope(
            child:MaterialApp(
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

class AppNavigator{
  static List<int> list= [];
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void pop(context) {
    print('onWillPop');
    if(list.length > 0){
      print('remove onWillPop');
      list.remove(list[list.length - 1]);

      var _context = AppNavigator.navigatorKey.currentContext;
      Navigator.pop(_context!);
    }
  }
  static void push(context, Widget widget) {
    var _context = AppNavigator.navigatorKey.currentContext;
    list.add(0);
    Navigator.push(
      _context!,
      MaterialPageRoute(builder: (context) => widget, fullscreenDialog: false),
    );
  }
}
