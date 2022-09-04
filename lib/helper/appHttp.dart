// import 'dart:convert';
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'appPropertis.dart';
// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'myHttpOverrides.dart';
//
// class AppHttp {
//   Future<dynamic> post(dynamic model,String url,{String? getUrl,bool checkVersion = true}) async{
//     HttpOverrides.global = new MyHttpOverrides();
//     try {
//       if(checkVersion) {
//         var version = await _checkVersion();
//         if (!version){
//           versionDialog();
//           throw {'error version'};
//         }
//       }
//
//       if(getUrl !=null)
//         url +='?' + getUrl;
//
//       var body;
//       if(model is apiModel.Model)
//         body = model.toJson();
//       else
//         body = model;
//
//       body.removeWhere((key, value) => key == null || value == null);
//
//       var  response = await http.post(
//         Uri.parse(url),
//         headers:  headers(),
//         body: jsonEncode(body),
//       ).catchError((error, stackTrace){
//         errorMessage(error);
//         throw {};
//       });
//
//       if(response.statusCode == 401 && AppPropertis.accessToken != null)
//         return refreshToken(body,url);
//
//       if (response.statusCode == 200) {
//         var res = json.decode(response.body) ;
//
//         if(res['Code'] == 401 && AppPropertis.accessToken != null)
//           return refreshToken(body,url);
//
//         if(res['Success'])
//           return res['Data'];
//         else
//           throw res;
//       }
//       else
//         throw json.decode(response.body);
//
//     } on SocketException {
//       errorMessage('Er501');
//     }
//   }
//
//   Future<dynamic> refreshToken(dynamic model,String url) async{
//
//     var refreshModel = GetRefreshTokenVM.setProperty(
//         client_id: AppStrings.clientId,
//         refresh_token:AppPropertis.objectToken()['refresh_token'],
//         grant_type : "refresh_token"
//     );
//     var body = refreshModel.toJson();
//     body.removeWhere((key, value) => key == null || value == null);
//
//     var  response = await http.post(
//       Uri.parse(TokenController.refresh),
//       headers:  headers(),
//       body: jsonEncode(body),
//     ).catchError((error, stackTrace){
//       errorMessage(error);
//       throw {};
//     });
//
//     if (response.statusCode == 200) {
//       var res = json.decode(response.body) ;
//
//       if(res['Success']) {
//         AppPropertis.accessToken = res['Data'];
//         local();
//         if(url != null)
//           return post(model, url);
//       }
//       else
//         closeDialog();
//     }
//     else
//       closeDialog();
//   }
//
//   Future<dynamic> token(dynamic model,String url) async{
//     try {
//       var body = model.toJson();
//       body.removeWhere((key, value) => key == null || value == null);
//       var  response = await http.post(
//         Uri.parse(url),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'ApiKey' : AppStrings.apiKey
//         },
//
//         body: jsonEncode(body),
//       ).catchError((error, stackTrace){
//         errorMessage(error);
//         throw {};
//       });
//
//       if (response.statusCode == 200) {
//         var res = json.decode(response.body) ;
//         if(res["data"] != null)
//           return res;
//         else
//           throw json.decode(response.body);
//       }
//       else
//         throw json.decode(response.body);
//
//     } on SocketException {
//       errorMessage('Er501');
//     }
//   }
//
//   Map<String,String>  headers(){
//
//     Map<String,String> header = {
//       'Content-Type': 'application/json; charset=utf-8',
//       // 'Content-Length':'<calculated when request is sent>',
//       //  'Host':'app.karmandiran.ir',
//       "ApplicationID": AppStrings.applicationID,
//       "ClientId": AppStrings.clientId,
//       "Authorization": AppPropertis.Authorization(),
//       //  "User-Agent": "AppKarmandiran/${AppStrings.appVersion}",
//       'ApiKey' : AppStrings.apiKey
//     };
//
//     header.removeWhere((key, value) => key == null || value == null);
//     return header;
//   }
//
//   Future<void> local() async {
//     SharedPreferences local = await SharedPreferences.getInstance();
//     local.setString("accessToken", jsonEncode(AppPropertis.accessToken));
//   }
//
//   static Future<bool> checkInternet() async {
//     var  response = await http.get(
//         Uri.parse('${AppStrings.apiHost}Run' ),
//         headers:  {'ApiKey' : AppStrings.apiKey}
//     ).catchError((error, stackTrace){});
//     if (response != null && response.statusCode != null && response.statusCode == 200)
//       return true;
//     return false;
//   }
//
//   Future<void> closeDialog() async {
//     streamMessage.add(Message.danger(
//         title: 'خطا',
//         msg: 'نشست شما به پایان رسیده است \n برای ادامه مجددا وارد شوید',
//         onOk: (context)=> loginController.add(LoginType.Exit)
//     ));
//   }
//
//   Future<void> errorMessage(error) async {
//     var net = await checkInternet();
//     if(net)
//       streamMessage.add(Message.danger(
//           title: 'خطای ناشناخته',
//           msg:  'یک خطای ناشناخته هنگام ارسال درخواست به سرور رخ داده . بعد از چند دقیقه'
//               ' مجددا تلاش نماید '
//               '\n در صورت عدم رفع مشکل آن را گزارش کنید'
//               '\n ${error}'
//       ));
//     else
//       streamMessage.add(Message.warning(
//           msg: 'اینترنت شما قطع میباشد '
//               '\n بعد از اطمینان از اتصال اینترنت مجددا تلاش نماید '
//               '\n در صورت عدم رفع مشکل آن را گزارش کنید'
//       ));
//   }
//
//   Future<bool> _checkVersion() async {
//
//     if(AppPropertis.appVersion != "" && AppPropertis.appVersion != "expired")
//       return true;
//     if(AppPropertis.appVersion == "expired")
//       return false;
//
//     var  response = await http.get(Uri.parse('${AppStrings.apiHost}api/v1/Version/GetLastAppVersion' ), headers:  {'ApiKey' : AppStrings.apiKey}).catchError((error, stackTrace){});
//     if (response != null && response.statusCode != null && response.statusCode == 200)
//     {
//       var res = json.decode(response.body) ;
//       AppPropertis.appVersion = res['Data'];
//
//       var v1 = AppPropertis.appVersion.split('.');
//       var v2 = AppStrings.appVersion.split('.');
//       if( Tools.StringToInt(v1[0]) > Tools.StringToInt(v2[0]) ||
//           Tools.StringToInt(v1[1]) > Tools.StringToInt(v2[1])
//       )
//       {
//         AppPropertis.appVersion = "expired";
//         return false;
//       }
//     }
//
//     return true;
//   }
//
//   Future<bool> versionDialog() async {
//     streamMessage.add(Message.danger(
//         title: 'خطا',
//         msg: 'برنامه باید بروزرسانی شود \n برای اطلاعات بیشتر روی دکمه زیر کلیک کنید',
//         onOk: (context)=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => VersionWidget()))
//     ));
//   }
// }
//
