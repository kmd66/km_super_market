import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/Widget/btn/BaseButton.dart';
import '../../../core/Widget/btn/baseBorderButton.dart';
import '../../../core/Widget/counDown.dart';
import '../../../core/Widget/hederTitle.dart';
import '../../../core/Widget/singleScroll.dart';
import '../../../core/Widget/textInput/textInputBorder.dart';
import '../../../core/model/enums.dart';
import '../../../core/model/navigation.dart';
import '../../../helper/textStyle.dart';
import '../../../helper/tools.dart';
import '../../main/myApp.dart';
import '../obj.dart';

class secretStampSms extends StatelessWidget{
  secretStampSms(this.obj);
  final Obj obj;
  CounDown? counDown;

  Widget build(BuildContext context) {
    return Column(children: [
      HederTitle(title: 'ورود به سامانه',),

      Expanded(
        child:
        SingleScroll(
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20), child:
              Column(children: [
                Container(
                  width:  MediaQuery.of(context).size.width ,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:Text('رمز عبور موقت',style: Style.h4(fontWeight:FontWeight.bold),),
                  ),
                ),
                textInputs(context),
                remainingTime()
              ]),
          ),
        ),
      ),

      BaseButton(
        'ورود به پلتفرم',
        pading: EdgeInsets.only(left: 19.0, right: 19.0, top: 19.0, bottom: 3.0),
        onPress:()=>checkUser_fake(),
      ),
      BaseBorderButton(
        'ویرایش اطلاعات ورود',
        pading: EdgeInsets.only(left: 19.0, right: 19.0, top: 3.0, bottom: 19.0),
        onPress:()=>
            MyApp.navigator.push(chengState: new ChengState(StateType.Main)),
      ),
    ]);
  }

  Widget remainingTime() {
    if(counDown == null)
      counDown = CounDown(seconds: 120,label:'زمان باقی مانده');
    return
      Padding(
          padding: const EdgeInsets.symmetric(vertical:14, horizontal: 5),
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                counDown!,
                TextButton(
                  onPressed: () {
                    sendSms();
                  },
                  child: Text(
                    'ارسال مجدد',
                    style: Style.h5(color:MyApp.color.base),
                  ),
                )
              ]
          )
      );
  }

  Widget textInputs(BuildContext context) {
    return   LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints)
        {
          var width =constraints.maxWidth /6;
          return Directionality(
              textDirection: TextDirection.ltr,
              child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width,
                  child:new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 0)),
                ),
                Container(
                  width: width,
                  child:new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 1)),
                ),
                Container(
                  width: width,
                  child: new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 2)),
                ),
                Container(
                  width: width,
                  child:new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 3)),
                ),
                Container(
                  width: width,
                  child: new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 4)),
                ),
                Container(
                  width: width,
                  child: new TextInputBorder('',maxLength:1, textInputType: TextInputType.number,onChange: (x)=> onChangeTextInput(context, x, 5)),
                )
              ],
            )
          );
        });
  }

  void onChangeTextInput(BuildContext context, String x, int i ) {
    if(!x.IsNullOrEmpty && i < 5)
      FocusScope.of(context).nextFocus();
    obj.SecurityStamp[i] = x;
  }

  Future<void> checkUser() async {
    // MyApp.events.streamLoad.add('loading');
    // obj.loginModel.SecurityStamp = obj.SecurityStamp[0]+obj.SecurityStamp[1]+
    //     obj.SecurityStamp[2]+obj.SecurityStamp[3]+
    //     obj.SecurityStamp[4]+obj.SecurityStamp[5];
    // obj.servic.getTokenByIndividual(obj.loginModel).then((value) {
    //   if(value.length > 0){
    //     AppPropertis.accessToken = value;
    //     checkLogin();
    //   }
    //   else
    //     streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'دسترسی غیر مجاز'));
    // }).catchError((err){
    //   // if(err['Message'] != null)
    //   //   streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['Message']));
    // }).whenComplete((){
    //   MyApp.events.streamLoad.add(null);
    // });
  }

  Future<void> checkLogin() async {
    //
    // MyApp.events.streamLoad.add('loading');
    // streamChengState.add(new ChengState(StateType.Instructions, navigationsAdd: false));
    // // SharedPreferences local = await SharedPreferences.getInstance();
    // //
    // // local.setString("currentUser", jsonEncode(AppPropertis.currentUser));
    // // local.setString("accessToken", jsonEncode(AppPropertis.accessToken));
    // //
    // // loginController.add(LoginType.Enter);
    // MyApp.events.streamLoad.add(null);
  }

  Future<void> sendSms() async {}

  Future<void> checkUser_fake() async {
    MyApp.navigator.push(chengState: new ChengState(StateType.Instructions));
  }
}