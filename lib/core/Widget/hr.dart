import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/main/myApp.dart';

//ignore: must_be_immutable
class Hr extends StatelessWidget{
  Hr ({this.marginLeft = 0.0,this.marginRight = 0.0,this.height = 28.0,this.lineColor});
  double marginRight= 0;
  double marginLeft = 0;
  double height= 0.0;
  final Color? lineColor;

  Widget build(BuildContext context) {
    return
      Container(
          margin: EdgeInsets.only(left: marginLeft, right: marginRight),
          child: Divider(
            color: lineColor!= null ? lineColor:MyApp.color.baseBorder,
            height: height,
          ));
  }
}
//ignore: must_be_immutable
class HrText extends StatelessWidget {
  HrText ({this.height = 28.0,this.lineColor ,this.label ='label'});

  Color? lineColor;
  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    if( lineColor == null)
      lineColor= MyApp.color.baseTextColor;
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: lineColor,
              height: height,
            )),
      ),

      Text(label,style: TextStyle(
          color:lineColor
      )),

      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: lineColor,
              height: height,
            )),
      ),
    ]);
  }
}