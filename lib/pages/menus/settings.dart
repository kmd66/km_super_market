import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/Widget/groupBox.dart';
import '../../core/Widget/hr.dart';
import '../../core/Widget/redoButton.dart';
import '../../core/abstract/baseMenuWidget.dart';
import '../../core/model/enums.dart';
import '../../helper/objectColor.dart';
import '../../helper/tools.dart';
import '../../main.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidget createState() => _SettingsWidget();
}

class _SettingsWidget extends BaseMenuWidget<SettingsWidget> {
  _SettingsWidget() : super('تنظیمات',true);

  final double size = 100;
  final double margin = 12;
  bool chaeng = false;

  void _setColer ({ColerType? colerType, dynamic? nightType}) {
      _setData();
    setState(() {
      if(colerType!=null)
        MyApp.color.colerType =colerType;
      if(nightType!=null){
        if(nightType == 1) {
          MyApp.color.nightType = NightType.Bright;
          MyApp.color.colerType =ColerType.Indigo;
        }
        else {
          MyApp.color.nightType = NightType.Dark;
          MyApp.color.colerType =ColerType.Blue;
        }
      }
    });
  }
  
  Future<void> _setData() async{
    SharedPreferences local = await SharedPreferences.getInstance();
    String? _colerType = ColerType.values.string(MyApp.color.colerType);
    String? _nightType = NightType.values.string(MyApp.color.nightType);
    local.setString("ColerType", _colerType!);
    local.setString("NightType",_nightType!);
  }


  @override
  void dispose() {
    super.dispose();
    MyApp.events.streamLoad.add('درحال بار گزاری');
    Future.delayed(const Duration(milliseconds: 2000), (){
      MyApp.events.streamLoad.add(null);
      MyApp.navigator.resetHistory();
    });
  }

  @override
  Widget stateBuild(BuildContext context) {
    return
      Center(
        child:
        Column(
          children: [
            Container(
              width: size,margin: EdgeInsets.all(margin),
            ),

            GroupBox(
              value:  MyApp.color.nightType == NightType.Bright? 1: 2,
              label: 'رنگ پسزمینه',
              listRedoButton: [
                RedoButton(label: 'روشن',value:1, margin: EdgeInsets.all(5.0),),
                RedoButton(label: 'تاریک',value:2, margin: EdgeInsets.all(5.0),),
              ],
              onChange: (v)=>_setColer(nightType: v),
            ),

            Container(
              width: size,margin: EdgeInsets.all(margin),
            ),
            HrText(height: 10.0,label: 'رنگ اشیا',lineColor:MyApp.color.baseTextColor ,),
            objectColors(),
          ],
        ),
      );
  }
  Widget objectColors() {
    return Wrap(children: [
      objectColorsItem(
          'قرمز',
          red,
          ColerType.Red),
      objectColorsItem(
          'نارنجی',
          orange,
          ColerType.Orange),

      objectColorsItem(
          'آبی',
          blue,
          ColerType.Blue),
      objectColorsItem(
          'سبز دودی',
          teal,
          ColerType.Teal),
      objectColorsItem(
          'صورتی',
          pink,
          ColerType.Pink),
      objectColorsItem(
          'سبز',
          green,
          ColerType.Green),
      objectColorsItem(
          'سبز روشن',
          lightGreen,
          ColerType.LightGreen),
      objectColorsItem(
          'بنفشه',
          violet,
          ColerType.Violet),
      objectColorsItem(
          'ارغوانی',
          purole,
          ColerType.Purole),
      objectColorsItem(
          'زرد',
          yellow,
          ColerType.Yellow),
      objectColorsItem(
          'نیلی',
          indigo,
          ColerType.Indigo),
      objectColorsItem(
          'آبی خاکستری',
          blueGrey,
          ColerType.BlueGrey),
      objectColorsItem(
          'قهوه ای',
          brown,
          ColerType.Brown),
      objectColorsItem(
          'فیروزه ای',
          cyan,
          ColerType.Cyan),
    ],);;
  }
  Widget objectColorsItem(String colorName, Color color,ColerType colerType ) {
    return Container(
      height: size,
      width: size,margin: EdgeInsets.all(margin),
      child:
      FloatingActionButton(
        child: Text(colorName),
        backgroundColor: color,
        onPressed:()=>_setColer (colerType:colerType),
      ),
    );
  }


}