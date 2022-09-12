import 'package:flutter/cupertino.dart';

import 'enums.dart';

class ChengState{
  StateType stateType;
  GlobalKey<NavigatorState>? globalKey;
  bool navigationsPush;
  bool navigationsAdd;
  bool scrollJump;
  bool getList;
  bool streamDialogHide;
  dynamic data;
  ChengState(this.stateType, {this.data , this.globalKey, this.navigationsAdd = false, this.navigationsPush = true, this.getList = true, this.streamDialogHide = false, this.scrollJump = true});
  static base() => new ChengState(StateType.Main);
}
class NavigationModel{
  NavigationModel({required this.route,ChengState? chengState}):
        this.chengState = chengState !=null ? chengState :ChengState.base();
  ChengState chengState ;
  RouteList route;
}