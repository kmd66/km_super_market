import 'package:flutter/material.dart';
import '../core/abstract/baseNavigationWidget.dart';
import '../core/model/enums.dart';
import '../main.dart';

class AppNavigator{

  List<int> list= [];
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Widget? _view;
  Widget? get view => _view;

  String _routeTitle = '';
  String get routeTitle => _routeTitle;

   String _routeUrl= '';
   String get routeUrl => _routeUrl;

   void pop() {
    if(list.length > 0){
      var _context = navigatorKey.currentContext;
    print('length ${list.length} $_context');
      Navigator.pop(_context!);
    list.remove(list[list.length - 1]);
    }
  }

   void push(RouteList route ) {
    var _context = navigatorKey.currentContext;
    list.add(0);
    var v =getView(route);

    print('uuuuuuuuu ${list.length} ${route.toString()} $_context');

    Navigator.push(
      _context!,
      MaterialPageRoute(builder: (context) => v, fullscreenDialog: false),
    );
  }
   Widget getView(RouteList route) {
    switch (route) {
      case RouteList.HomePage:
        _routeTitle = 'صفحه اصلی';
        return HomePage();
        break;
      case RouteList.AboutPage:
        _routeTitle = 'درباره ما';
        return AboutPage();
        break;

      case RouteList.LoginPage:
        _routeTitle = 'رمز پویا';
        return LoginPage();
        break;

      default :
        _routeTitle = 'صفحه اصلی';
        return HomePage();
        break;
    }
  }
}