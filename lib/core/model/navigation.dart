import 'enums.dart';

class ChengState{
  StateType stateType;
  bool navigationsPush;
  bool navigationsAdd;
  bool scrollJump;
  bool getList;
  bool streamDialogHide;
  dynamic data;
  ChengState(this.stateType, {this.data , this.navigationsAdd = true, this.navigationsPush = true, this.getList = true, this.streamDialogHide = false, this.scrollJump = true});
  static base() => new ChengState(StateType.Main);
}
class NavigationModel{
  NavigationModel({required this.route,ChengState? chengState}):
        this.chengState = chengState !=null ? chengState :ChengState.base();
  ChengState chengState ;
  RouteList route;
}