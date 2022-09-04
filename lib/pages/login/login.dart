// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../core/model/enums.dart';
// import '../main/myApp.dart';
// import 'obj.dart';
//
// class Login extends  BaseStatefulWidget {
//   @override
//   _Login createState() {
//     return _Login(chengState);
//   }
// }
//
// class _Login extends BaseState<Login> {
//   _Login(ChengState chengState) : super(streamChengState =  StreamController<ChengState>(),RouteList.LoginPage, chengState);
//
//   Obj obj = new Obj();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void changeState(ChengState value ,{navigationsAdd = true}) {
//     super.changeState(value);
//     switch (stateType) {
//       case StateType.Content:
//         contentState(value);
//         break;
//       default:
//         contentState(value);
//         break;
//     }
//     setState(() {
//     });
//   }
//
//
//   void contentState(ChengState value) {
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // return map();
//     return
//       Scaffold(body:
//       Container(
//           width:  MediaQuery.of(context).size.width ,
//           height: MediaQuery.of(context).size.height ,
//           decoration: BoxDecoration(
//             color: MyApp.color.baseBackground,
//           ),
//           child:view()
//
//       )
//       );
//   }
//
//   Widget view() {
//     if(stateType ==  StateType.Main)
//       return new Main(obj);
//     else if(stateType ==  StateType.Instructions)
//       return new Instructions(obj);
//     else return new secretStampSms(obj);
//   }
//
// }


import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/Widget/loading.dart';
import '../../core/abstract/baseMenuWidget.dart';
import '../../core/abstract/baseNavigationWidget.dart';
import '../../core/model/enums.dart';
import '../../core/model/navigation.dart';
import '../../helper/AppNavigator.dart';
import '../../helper/appPropertis.dart';
import '../../helper/myCustomScrollBehavior.dart';
import '../../helper/objectColor.dart';
import '../../helper/events.dart';
import '../main/myApp.dart';
import '../menus/menus.dart';

class LoginPage extends BaseStatefulWidget<_LoginPage> {
  LoginPage(GlobalKey<NavigatorState> key) : super(key);

  @override
  _LoginPage createState(){
    state = _LoginPage();
    return state!;
  }
}

class _LoginPage extends BaseNavigationWidget {
  _LoginPage() : super(ChengState(StateType.Main), RouteList.LoginPage);
  String mobile='';

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Container(
        child: ElevatedButton(
          onPressed:()=>_login(),
          child: Text('Looks like a RaisedButton'),
        ),
      ),
    );
  }

  @override
  Widget stateBuild(BuildContext context) {
    // TODO: implement stateBuild
    throw UnimplementedError();
  }

  Future<void> _login() async {
    MyApp.propertis.accessToken = 'null';
    MyApp.propertis.currentUser = 'null';
    SharedPreferences local = await SharedPreferences.getInstance();
    local.setString("currentUser", jsonEncode(MyApp.propertis.currentUser));
    local.setString("accessToken", jsonEncode(MyApp.propertis.accessToken));
    MyApp.events.loginController.add(LoginType.Enter);
  }

}
