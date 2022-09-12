import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/abstract/baseNavigationWidget.dart';
import '../core/model/enums.dart';
import '../core/model/navigation.dart';
import '../pages/home.dart';
import '../pages/main/about.dart';
import '../pages/menus/main.dart';
import '../pages/menus/settings.dart';
import '../pages/main/myApp.dart';
import '../pages/profile/profile.dart';

class AppNavigator{

  List<NavigationModel> list= [];
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _mainObjKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState>  get mainObjKey {
    _mainObjKey = GlobalKey<NavigatorState>();
    return _mainObjKey;
  }

  Widget? _view;
  Widget? get view => _view;

  String _routeTitle = '';
  String get routeTitle => _routeTitle;

  String _routeUrl= '';
  String get routeUrl => _routeUrl;

  bool _isMenu = false;
  bool get isMenu => _isMenu;

  void pop() {
    if(_isMenu){
      MyApp.events.streamMenu.add(MenuList.hide);
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
      }
      else{
        MyApp.propertis.currentRoute =RouteList.HomePage;
        MyApp.propertis.currentState =StateType.Main;
      }
      _showNavigationBar();
    }
    else{
      try {
        if (Platform.isAndroid) {
        _showExitDialog();
        }
      } catch (e) {}
    }

  }

  void resetHistory({Widget ? builderView}) {
    var _context = navigatorKey.currentContext;
    list = [];
    if(builderView == null)
      builderView = getView(RouteList.HomePage, mainObjKey);
    Navigator.of(_context!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) =>  builderView! ), (Route<dynamic> route) => false
    );
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
      if(chengState.navigationsAdd)
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
    {
      var mainWidget = _mainObjKey.currentWidget;
      return mainWidget;
    }
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
      case RouteList.ProfilePage:
        _routeTitle = 'پروفایل';
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

      case RouteList.ProfilePage:
        return ProfilePage(key);

      default :
        return HomePage(key);
    }
  }

  Widget getMenu(MenuList menuList){
    if(menuList == MenuList.hide)
      _isMenu = false;
    else
    _isMenu = true;

    switch (menuList) {
      case MenuList.Setting:
        return SettingsWidget();
      case MenuList.Main:
        return MainMenuWidget();
      default:
        return Container(height: 0,width: 0,);
    }
  }

  void _showExitDialog() {
    var _context = navigatorKey.currentContext;

    showDialog(
      context: _context!,
      builder: (context) {
        return AlertDialog(
          title: Text("خروج"),
          content: Text("آیا میخواهید از برنامه خارج شوید؟"),
          actions: <Widget>[
            TextButton(
              child: Text("خیر"),
              onPressed:  ()=>Navigator.pop(context),
            ),
            TextButton(
              child: Text("بله"),
              onPressed:  (){
                Navigator.pop(context);
                SystemNavigator.pop();
              },
            )
          ],
        );
      },
    );
  }

}