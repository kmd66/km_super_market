import 'dart:async';
import 'package:flutter/material.dart';
import '../../pages/main/myApp.dart';
import '../../helper/textStyle.dart';

class LoadinWidget extends StatefulWidget {
  @override
  _LoadinWidget createState() => _LoadinWidget();
}

class _LoadinWidget extends State<LoadinWidget> {
  String? _text ;

  @override
  void initState() {
    initStream();
    super.initState();
  }

  void  initStream(){
    if(MyApp.events.streamLoad.hasListener == true)
      MyApp.events.streamLoad.close();
    MyApp.events.streamLoad = StreamController<String?>();
    MyApp.events.streamLoad.stream.listen((value){
      _text = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return  _text != null?
    Positioned(
      child:Material(
          type: MaterialType.transparency,
          child:
          Container(
            // height: context.watch<loadBloc>().routeUrl  == false? 0 :MediaQuery.of(context).size.width,
            // width: context.watch<loadBloc>().routeUrl  == false? 0 :MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(125,0,0,0),
            ),
            child: Center(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text(_text!,style: Style.textSplashScreen),
              ],
            )
            ) ,
          )
      ),
      top:  0,
      left: 0,
      right: 0,
      bottom: 0,
    ):
    Container(width: 0, height: 0,);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
