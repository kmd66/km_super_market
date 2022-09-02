import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:prj/pages/main/myApp.dart';
import 'core/Widget/textInput/textInputBorder.dart';
import 'core/abstract/baseNavigationWidget.dart';
import 'core/model/enums.dart';
import 'core/model/navigation.dart';
import 'helper/myHttpOverrides.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends BaseNavigationWidget<HomePage> {
  _HomePage() : super(ChengState(StateType.Main), RouteList.HomePage);
  String mobile='';
  @override
  Widget stateBuild(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: const Text('Open route'),
        onPressed: () {
          MyApp.navigator.push(RouteList.AboutPage);
        },
      ),
      ElevatedButton(
        onPressed: () {
          MyApp.navigator.pop();
        },
        child: const Text('Go back!'),
      ),
      new TextInputBorder('شماره همراه',maxLength: 11, textInputType: TextInputType.number,hintLabel:'شماره همراه خود را وارد کنید',modelLabel:'شماره همراه', model: mobile,onChange: (x)=> mobile = x,),
      new TextInputBorder('شماره همراه',enabled: false, textInputType: TextInputType.number,hintLabel:'شماره همراه خود را وارد کنید',modelLabel:'شماره همراه', model: 'kk'),

    ]);

  }

}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends BaseNavigationWidget<LoginPage> {
  _LoginPage() : super(ChengState(StateType.Main), RouteList.LoginPage);

  @override
  Widget stateBuild(BuildContext context) {
    return Container(
      child: Center(
          child: Column(children: [
            ElevatedButton(
              child: const Text('Open route'),
              onPressed: () {
                MyApp.navigator.push(RouteList.HomePage);
              },
            ),
            ElevatedButton(
              onPressed: () {
                MyApp.navigator.pop();
              },
              child: const Text('Go back!'),
            ),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
            Padding(padding: EdgeInsets.only(top: 100),child: Container(width: 10,height: 10,color: Colors.green,),),
          ],)
      ),
    );
  }
}

