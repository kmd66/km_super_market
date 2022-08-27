import 'package:flutter/material.dart';

class AppNavigator{
  static List<int> list= [];
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


  static Widget? _view;
  static Widget? get view => _view;

  static  String _routeTitle = '';
  static  String get routeTitle => _routeTitle;

  static String _routeUrl= '';
  static String get routeUrl => _routeUrl;


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