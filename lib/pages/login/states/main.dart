import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prj/pages/main/myApp.dart';
import '../../../core/Widget/btn/BaseButton.dart';
import '../../../core/Widget/hederTitle.dart';
import '../../../core/Widget/singleScroll.dart';
import '../../../core/Widget/textInput/textInputBorder.dart';
import '../../../core/model/enums.dart';
import '../../../core/model/navigation.dart';
import '../../../helper/tools.dart';
import '../obj.dart';

class Main extends StatelessWidget{
  Main(this.obj);
  final Obj obj;
  final FocusNode _passwordFocus = FocusNode();

  Widget build(BuildContext context) {
    return
      Column(children: [
        HederTitle(title: 'خوش آمدید',),
        Expanded(
          child:
          SingleScroll(
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20), child:
            Column(children: [
              new TextInputBorder('شماره موبایل',maxLength: 11, focusNode: _passwordFocus,textInputType: TextInputType.number,hintLabel:'تلفن همراه خود را وارد کنید',model: obj.loginModel.CellPhone,onChange: (x)=> obj.loginModel.CellPhone = x,),
            ])
            ),
          ),
        ),
        BaseButton(
          'دریافت رمز عبور موقت',
          pading: EdgeInsets.all(19.0),
          onPress:()=>checkUser_fake(),
        ),
      ]);
  }


  Future<void> checkUser_fake() async {
    MyApp.navigator.push(chengState: new ChengState(StateType.SecretStampSms));
    // streamChengState.add();
  }

}