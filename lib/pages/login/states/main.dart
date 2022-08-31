// import 'package:flutter/material.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/hederTitle.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/textInputBorder.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:kama_aro_karmandiran/core/bloc/events.dart';
// import 'package:kama_aro_karmandiran/core/model/chengState.dart';
// import 'package:kama_aro_karmandiran/core/model/enums.dart';
// import 'package:kama_aro_karmandiran/core/model/message.dart' as msgModel;
// import 'package:kama_aro_karmandiran/helper/appPropertis.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/baseButton.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/singleScroll.dart';
// import '../../../helper/tools.dart';
// import '../obj.dart';
//
// class Main extends StatelessWidget{
//   Main(this.obj);
//   final Obj obj;
//   final FocusNode _userNameFocus = FocusNode();
//   final FocusNode _passwordFocus = FocusNode();
//
//   Widget build(BuildContext context) {
//     return
//       Column(children: [
//         HederTitle(title: 'خوش آمدید',),
//         Expanded(
//           child:
//           SingleScroll(
//             Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20), child:
//             Column(children: [
//               new TextInputBorder('کد ملی',maxLength: 10, focusNode: _userNameFocus, textInputType: TextInputType.number,hintLabel:'کد ملی خود را وارد کنید',modelLabel:'UserName', model: obj.loginModel.username,onChange: (x)=> obj.loginModel.username = x,),
//               new TextInputBorder('شماره موبایل',maxLength: 11, focusNode: _passwordFocus,textInputType: TextInputType.number,hintLabel:'تلفن همراه خود را وارد کنید',model: obj.loginModel.CellPhone,onChange: (x)=> obj.loginModel.CellPhone = x,),
//             ])
//             ),
//           ),
//         ),
//         BaseButton(
//           'دریافت رمز عبور موقت',
//           pading: EdgeInsets.all(19.0),
//           onPress:()=>checkUser(),
//         ),
//       ]);
//   }
//
//   Future<void> checkUser() async {
//     streamLoad.add('loading');
//     obj.servic.sendSecurityCodeBySmsByNationalCode(obj.loginModel).then((value) {
//       AppPropertis.currentUser = value;
//       streamChengState.add(new ChengState(StateType.SecretStampSms));
//     }).catchError((err)=>Tools.showError(err)).whenComplete((){
//       streamLoad.add(null);
//     });
//
//   }
//
//   Future<void> checkUser_fake() async {
//     AppPropertis.currentUser = 'value';
//     streamChengState.add(new ChengState(StateType.SecretStampSms, navigationsAdd: false));
//   }
//
// }