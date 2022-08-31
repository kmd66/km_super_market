// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'obj.dart';
//
// class Login extends  BaseStatefulWidget {
//   @override
//   _Login createState() {
//     // if(streamChengState.hasListener == true)
//     //   streamChengState.close();
//
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
//             color: ObjectColor.baseBackground,
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
