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
      var nav = list[list.length - 1];
      list.remove(list[list.length - 1]);

      if(nav.chengState.navigationsPush) {
        var _context = navigatorKey.currentContext;
        Navigator.pop(_context!);
      }
      else{
        var state = getLastState();
        if(state == null)
          return;
        if(state.route == MyApp.propertis.currentRoute){
          state.streamChengState.add(nav.chengState);
        }
      }

      if(list.length > 0){
        var NavigatorState = list[list.length - 1];
        MyApp.propertis.currentRoute =NavigatorState.route;
        MyApp.propertis.currentState =NavigatorState.chengState.stateType;
        _showNavigationBar();
      }

    }
  }

  void resetHistory() {
    var _context = navigatorKey.currentContext;
    list = [];
    Navigator.of(_context!).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        getView(RouteList.HomePage,GlobalKey<NavigatorState>())), (Route<dynamic> route) => false);
  }

  void push({RouteList? route,ChengState? chengState}) {
    if(route != null)
      _push(new NavigationModel(route: route));
    else if(chengState != null)
      _changeState(chengState);
  }
  void _changeState(ChengState chengState) {
    var state = getLastState();
    if(state != null) {
      MyApp.propertis.currentRoute =state.route;
      MyApp.propertis.currentState =chengState.stateType;

      chengState.navigationsPush= false;
      list.add(new NavigationModel(route: state.route,chengState: chengState));
      state.streamChengState.add(chengState);
    }
  }

  void _push(NavigationModel model) {
    var _context = navigatorKey.currentContext;

    GlobalKey<NavigatorState> key=GlobalKey<NavigatorState>();
    model.chengState.globalKey =key;
    list.add(model);
    var v =getView(model.route, key);

    MyApp.propertis.currentRoute =model.route;
    MyApp.propertis.currentState =model.chengState.stateType;

    Navigator.push(
      _context!,
      MaterialPageRoute(builder: (context) => v, fullscreenDialog: false),
    );
  }

  void _showNavigationBar(){
    var state = getLastState();
    if(state != null) {
      setRouteTitle(state.route);
      state.navigationBarWidget.state?.setState(() {
        state.navigationBarWidget.state?.model.scrollHide = 3;
        state.navigationBarWidget.state?.model.isShow = true;
      });
    }
  }

  Widget? getLastWidget(){
    if(list.length == 0)
      return null;
    var key =list[list.length - 1].chengState.globalKey;
    var currentWidget = key?.currentWidget;
    return currentWidget;
  }

  BaseNavigationWidget? getLastState(){
    var currentWidget = getLastWidget();
    if(currentWidget != null) {
      var state = (currentWidget as BaseStatefulWidget).state as BaseNavigationWidget;
      return state;
    }
    return null;
  }

  void setRouteTitle(RouteList route) {
    switch (route) {
      case RouteList.HomePage:
        _routeTitle = 'صفحه اصلی';
        break;
      case RouteList.AboutPage:
        _routeTitle = 'درباره ما';
        break;
      case RouteList.LoginPage:
        _routeTitle = 'ورود';
        break;
      default :
        _routeTitle = 'صفحه اصلی';
        break;
    }
  }
  Widget getView(RouteList route, GlobalKey<NavigatorState> key) {
    setRouteTitle(route);
    switch (route) {
      case RouteList.HomePage:
        return HomePage(key);

      case RouteList.AboutPage:
        return AboutPage(key);

      case RouteList.LoginPage:
        return LoginPage(key);

      default :
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