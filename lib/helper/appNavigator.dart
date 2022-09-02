import 'package:flutter/material.dart';
import '../core/abstract/baseNavigationWidget.dart';
import '../core/model/enums.dart';
import '../core/model/navigation.dart';
import '../main.dart';
import '../pages/menus/main.dart';
import '../pages/menus/settings.dart';
import '../pages/main/myApp.dart';

class AppNavigator{
  void Function(Widget)? menuCallback;

  List<int> list= [];
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Widget? _view;
  Widget? get view => _view;

  String _routeTitle = '';
  String get routeTitle => _routeTitle;

  String _routeUrl= '';
  String get routeUrl => _routeUrl;

  bool isMenu = false;

  void pop() {
    if(isMenu){
      MyApp.events.streamClosePopupState.add(true);
      return;
    }

    if(list.length > 0){
      var _context = navigatorKey.currentContext;

      Navigator.pop(_context!);
      list.remove(list[list.length - 1]);
    }
  }

  void resetHistory() {
    var _context = navigatorKey.currentContext;
    list = [];
    Navigator.of(_context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        getView(RouteList.HomePage)), (Route<dynamic> route) => false);
  }

  void push({RouteList? route,NavigationModel? navigation}) {
    if(route != null)
      _push(NavigationModel(route: route));
    else if(navigation != null)
      _push(navigation);
  }
  void _push(NavigationModel model ) {
    var _context = navigatorKey.currentContext;
    list.add(0);
    var v =getView(model.route);

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

      case RouteList.AboutPage:
        _routeTitle = 'درباره ما';
        return AboutPage();

      case RouteList.LoginPage:
        _routeTitle = 'ورود';
        return LoginPage();

      default :
        _routeTitle = 'صفحه اصلی';
        return HomePage();
    }
  }

  void setMenu(MenuList menuList){
    Widget? menuWidget;
    if(menuList != MenuList.hide)
      isMenu = true;
    switch (menuList) {
      case MenuList.Setting:
        menuWidget = SettingsWidget();
        break;
      case MenuList.Main:
        menuWidget = MainMenuWidget();
        break;
      default:
        menuWidget = Container(height: 0,width: 0,);
    }
    menuCallback!(menuWidget);
  }
}