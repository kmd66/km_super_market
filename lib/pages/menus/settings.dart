import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/Widget/groupBox.dart';
import '../../core/Widget/hr.dart';
import '../../core/Widget/redoButton.dart';
import '../../core/abstract/baseMenuWidget.dart';
import '../../core/model/enums.dart';
import '../../helper/objectColor.dart';
import '../main/myApp.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidget createState() => _SettingsWidget();
}

class _SettingsWidget extends BaseMenuWidget<SettingsWidget> {
  _SettingsWidget() : super('تنظیمات',true);

  final double size = 40;
  final double margin = 12;
  bool chaeng = false;

  void _setColer ({ColerType? colerType,ColerType? colerLinkType, dynamic? nightType}) {
      _setData();
    setState(() {
      if(colerType!=null)
        MyApp.color.colerType =colerType;
      if(colerLinkType!=null)
        MyApp.color.colerLinkType =colerLinkType;
      if(nightType!=null){
        if(nightType == 1) {
          MyApp.color.nightType = NightType.Bright;
          MyApp.color.colerType =ColerType.Indigo;
          MyApp.color.colerLinkType =ColerType.Yellow;
        }
        else {
          MyApp.color.nightType = NightType.Dark;
          MyApp.color.colerType =ColerType.BlueGrey;
          MyApp.color.colerLinkType =ColerType.Purole;
        }
      }
    });
  }
  
  Future<void> _setData() async{
    SharedPreferences local = await SharedPreferences.getInstance();
    String? _nightType = NightType.values.string(MyApp.color.nightType);
    local.setString("nightType",_nightType!);

    String? _colerType = ColerType.values.string(MyApp.color.colerType);
    local.setString("colerType", _colerType!);
    String? _colerLinkType = ColerType.values.string(MyApp.color.colerLinkType);
    local.setString("colerLinkType", _colerLinkType!);
    chaeng = true;
  }

  @override
  void dispose() {
    super.dispose();
    if (chaeng)
      MyApp.events.loginController.add(LoginType.Enter);
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
            HrText(height: 10.0,label: 'رنگ پیوند',lineColor:MyApp.color.linkColor ,),
            linkColors(),
            Container(
              width: size,margin: EdgeInsets.all(margin),
              height: 15,
              color: MyApp.color.linkColor,
            ),
          ],
        ),
      );
  }
  Widget objectColors() {
    return Wrap(children: [
      objectColorsItem(
          red,
          ColerType.Red),
      objectColorsItem(
          orange,
          ColerType.Orange),
      objectColorsItem(
          blue,
          ColerType.Blue),
      objectColorsItem(
          teal,
          ColerType.Teal),
      objectColorsItem(
          pink,
          ColerType.Pink),
      objectColorsItem(
          green,
          ColerType.Green),
      objectColorsItem(
          lightGreen,
          ColerType.LightGreen),
      objectColorsItem(
          violet,
          ColerType.Violet),
      objectColorsItem(
          purole,
          ColerType.Purole),
      objectColorsItem(
          yellow,
          ColerType.Yellow),
      objectColorsItem(
          indigo,
          ColerType.Indigo),
      objectColorsItem(
          blueGrey,
          ColerType.BlueGrey),
      objectColorsItem(
          brown,
          ColerType.Brown),
      objectColorsItem(
          cyan,
          ColerType.Cyan),
    ],);
  }
  Widget objectColorsItem(Color color,ColerType colerType ) {
    return Container(
      height: size,
      width: size,margin: EdgeInsets.all(margin),
      child:
      FloatingActionButton(
        backgroundColor: color,
        onPressed:()=>_setColer (colerType:colerType),
      ),
    );
  }

  Widget linkColors() {
    return Wrap(children: [
      linkColorsItem(
          redLink,
          ColerType.Red),
      linkColorsItem(
          puroleLink,
          ColerType.Purole),
      linkColorsItem(
          blueLink,
          ColerType.Blue),
      linkColorsItem(
          tealLink,
          ColerType.Teal),
      linkColorsItem(
          pinkLink,
          ColerType.Pink),
      linkColorsItem(
          yellowLink,
          ColerType.Yellow),
      linkColorsItem(
          brownLink,
          ColerType.Brown),
    ],);
  }
  Widget linkColorsItem(Color color,ColerType colerLinkType ) {
    return Container(
      height: size,
      width: size,margin: EdgeInsets.all(margin),
      child:
      FloatingActionButton(
        backgroundColor: color,
        onPressed:()=>_setColer (colerLinkType:colerLinkType),
      ),
    );
  }


}