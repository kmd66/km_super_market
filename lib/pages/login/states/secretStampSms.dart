// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/counDown.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/hederTitle.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/textInputBorder.dart';
// import 'package:kama_aro_karmandiran/core/apiModel.dart' as apiModel;
// import 'package:flutter/cupertino.dart';
// import 'package:kama_aro_karmandiran/core/bloc/events.dart';
// import 'package:kama_aro_karmandiran/core/model/chengState.dart';
// import 'package:kama_aro_karmandiran/core/model/enums.dart';
// import 'package:kama_aro_karmandiran/helper/appPropertis.dart';
// import 'package:kama_aro_karmandiran/helper/objectColor.dart';
// import 'package:kama_aro_karmandiran/helper/textStyle.dart';
// import 'package:kama_aro_karmandiran/page/main/events.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:kama_aro_karmandiran/core/model/message.dart' as msgModel;
// import 'package:kama_aro_karmandiran/core/Widgets/baseButton.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/baseBorderButton.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/singleScroll.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/messageContainer.dart';
// import 'package:kama_aro_karmandiran/helper/tools.dart';
// import '../obj.dart';
//
// class secretStampSms extends StatelessWidget{
//   secretStampSms(this.obj);
//   final Obj obj;
//   CounDown counDown;
//
//   Widget build(BuildContext context) {
//     return Column(children: [
//       HederTitle(title: 'ورود به سامانه',),
//
//       Expanded(
//         child:
//         SingleScroll(
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20), child:
//               Column(children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10.0),
//                   child:
//                   MessageContainer.info('کد ارسال شده به شماره ${obj.loginModel.CellPhone} را وارد کنید'),
//                 ),
//                 Container(
//                   width:  MediaQuery.of(context).size.width ,
//                   child:
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child:Text('رمز عبور موقت',style: Style.h4(fontWeight:FontWeight.bold),),
//                   ),
//                 ),
//                 textInputs(context),
//                 remainingTime()
//               ]),
//           ),
//         ),
//       ),
//
//       BaseButton(
//         'ورود به پلتفرم',
//         pading: EdgeInsets.only(left: 19.0, right: 19.0, top: 19.0, bottom: 3.0),
//         onPress:()=>checkUser(),
//       ),
//       BaseBorderButton(
//         'ویرایش اطلاعات ورود',
//         pading: EdgeInsets.only(left: 19.0, right: 19.0, top: 3.0, bottom: 19.0),
//         onPress:()=> streamChengState.add(new ChengState(StateType.Main, navigationsAdd: false)),
//       ),
//     ]);
//   }
//
//   Widget remainingTime() {
//     if(counDown == null)
//       counDown = CounDown(seconds: obj.SmsRemainingTime,label:'زمان باقی مانده');
//     return
//       Padding(
//           padding: const EdgeInsets.symmetric(vertical:14, horizontal: 5),
//           child:
//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 counDown,
//                 TextButton(
//                   onPressed: () {
//                     sendSms();
//                   },
//                   child: Text(
//                     'ارسال مجدد',
//                     style: Style.h5(color:BaseColor),
//                   ),
//                 )
//               ]
//           )
//       );
//   }
//
//   Widget textInputs(BuildContext context) {
//     return   LayoutBuilder(
//         builder: (BuildContext context, BoxConstraints constraints)
//         {
//           var width =constraints.maxWidth /6;
//           return Directionality(
//               textDirection: TextDirection.ltr,
//               child:
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: width,
//                   child:new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 0)),
//                 ),
//                 Container(
//                   width: width,
//                   child:new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 1)),
//                 ),
//                 Container(
//                   width: width,
//                   child: new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 2)),
//                 ),
//                 Container(
//                   width: width,
//                   child:new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 3)),
//                 ),
//                 Container(
//                   width: width,
//                   child: new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 4)),
//                 ),
//                 Container(
//                   width: width,
//                   child: new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 5)),
//                 )
//               ],
//             )
//           );
//         });
//   }
//
//   void onChangeTextInput(BuildContext context, String x, int i ) {
//     if(!Tools.IsNullOrEmpty(x) && i < 5)
//       FocusScope.of(context).nextFocus();
//     obj.SecurityStamp[i] = x;
//   }
//
//   Future<void> checkUser() async {
//     streamLoad.add('loading');
//     obj.loginModel.SecurityStamp = obj.SecurityStamp[0]+obj.SecurityStamp[1]+
//         obj.SecurityStamp[2]+obj.SecurityStamp[3]+
//         obj.SecurityStamp[4]+obj.SecurityStamp[5];
//     obj.servic.getTokenByIndividual(obj.loginModel).then((value) {
//       if(value.length > 0){
//         AppPropertis.accessToken = value;
//         checkLogin();
//       }
//       else
//         streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'دسترسی غیر مجاز'));
//     }).catchError((err){
//       if(err['Message'] != null)
//         streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['Message']));
//     }).whenComplete((){
//       streamLoad.add(null);
//     });
//   }
//
//   Future<void> checkLogin() async {
//
//     streamChengState.add(new ChengState(StateType.Instructions, navigationsAdd: false));
//     // SharedPreferences local = await SharedPreferences.getInstance();
//     //
//     // local.setString("currentUser", jsonEncode(AppPropertis.currentUser));
//     // local.setString("accessToken", jsonEncode(AppPropertis.accessToken));
//     //
//     // loginController.add(LoginType.Enter);
//     streamLoad.add(null);
//   }
//
//   Future<void> sendSms() async {
//
//     streamLoad.add('loading');
//     obj.servic.sendSecurityCodeBySmsByNationalCode(obj.loginModel).then((value) {
//       if(counDown == null)
//         counDown.reset();
//     }).catchError((err){
//       try{
//         if(err['Message'] != null)
//           streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['Message']));
//         else if(err['message'] != null)
//           streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['message']));
//         else
//           streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'خطای ناشناخته'));
//       }
//       catch(e){
//         streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'خطای ناشناخته'));
//       }
//     }).whenComplete((){
//       streamLoad.add(null);
//     });
//
//     // counDown = CounDown(seconds: obj.SmsRemainingTime,label:'زمان باقی مانده');
//     // streamChengState.add(new ChengState(StateType.SecretStampSms, navigationsAdd: false));
//   }
//
//   Future<void> checkUser_fake() async {
//     AppPropertis.accessToken = 'value';
//     streamChengState.add(new ChengState(StateType.Instructions, navigationsAdd: false));
//   }
// }