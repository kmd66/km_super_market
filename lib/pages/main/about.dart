import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/Widget/textInput/textInputBorder.dart';
import '../../core/abstract/baseNavigationWidget.dart';
import '../../core/model/enums.dart';
import '../../core/model/navigation.dart';
import '../../pages/main/myApp.dart';

class AboutPage extends BaseStatefulWidget<_AboutPage> {
  AboutPage(GlobalKey<NavigatorState> key) : super(key);

  @override
  _AboutPage createState(){
    state = _AboutPage();
    return state!;
  }
}

class _AboutPage extends BaseNavigationWidget {
  _AboutPage() : super(ChengState(StateType.Main), RouteList.AboutPage);
  String mobile='';

  @override
  Widget stateBuild(BuildContext context) {
    return Center(
        child: Column(children: [
          ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              MyApp.navigator.push(route: RouteList.LoginPage);
            },
          ),
          ElevatedButton(
            onPressed: () {
              MyApp.navigator.pop();
            },
            child: const Text('Go back!'),
          ),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          new TextInputBorder('شماره همراه',maxLength: 11, textInputType: TextInputType.number,hintLabel:'شماره همراه خود را وارد کنید',modelLabel:'شماره همراه', model: mobile,onChange: (x)=> mobile = x,),
          new TextInputBorder('شماره همراه',enabled: false, textInputType: TextInputType.number,hintLabel:'شماره همراه خود را وارد کنید',modelLabel:'شماره همراه', model: 'kk'),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
          Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.amber,),),
        ],)
    );
  }
}