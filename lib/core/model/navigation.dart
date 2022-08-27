import 'enums.dart';

class ChengState{
  StateType stateType;
  bool navigationsAdd;
  bool scrollJump;
  bool getList;
  bool streamDialogHide;
  dynamic data;
  ChengState(this.stateType, {this.data , this.navigationsAdd = true, this.getList = true, this.streamDialogHide = false, this.scrollJump = true});
}
class Navigation{
  Navigation({this.route,this.chengState});
  ChengState? chengState ;
  RouteList? route;
}