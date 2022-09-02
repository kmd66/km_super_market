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

  List<NavigationModel> list= [];
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

      list.remove(list[list.length - 1]);
      Navigator.pop(_context!);
    }
  }

  void resetHistory() {
    var _context = navigatorKey.currentContext;
    list = [];
    Navigator.of(_context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        getView(RouteList.HomePage,GlobalKey<NavigatorState>())), (Route<dynamic> route) => false);
  }

  void push({RouteList? route,NavigationModel? navigation}) {

    if(route != null)
      _push(new NavigationModel(route: route));
    else if(navigation != null)
      _push(navigation);
  }
  void _push(NavigationModel model) {
    var _context = navigatorKey.currentContext;

    GlobalKey<NavigatorState> key=GlobalKey<NavigatorState>();
    model.chengState.globalKey =key;
    list.add(model);
    var v =getView(model.route, key);


    Navigator.push(
      _context!,
      MaterialPageRoute(builder: (context) => v, fullscreenDialog: false),
    ).then((value) => lastWidget());
  }

  void lastWidget(){
    if(list.length == 0)
      return;

    var key =list[list.length - 1].chengState.globalKey;
    var currentWidget = key?.currentWidget;
    if(currentWidget != null) {
      var model = (currentWidget as BaseStatefulWidget).state as BaseNavigationWidget;
      print(model.navigationBarWidget.state?.model.isShow);
      model.navigationBarWidget.state?.setState(() {
        model.navigationBarWidget.state?.model.scrollHide = 3;
        model.navigationBarWidget.state?.model.isShow = true;
      });
      print(model.navigationBarWidget.state?.model.isShow);
    }
  }

  Widget getView(RouteList route, GlobalKey<NavigatorState> key) {
    switch (route) {
      case RouteList.HomePage:
        _routeTitle = 'صفحه اصلی';
        return HomePage(key);

      case RouteList.AboutPage:
        _routeTitle = 'درباره ما';
        return AboutPage(key);

      case RouteList.LoginPage:
        _routeTitle = 'ورود';
        return LoginPage(key);

      default :
        _routeTitle = 'صفحه اصلی';
        return HomePage(key);
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