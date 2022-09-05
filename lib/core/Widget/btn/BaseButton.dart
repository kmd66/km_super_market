import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/pages/main/myApp.dart';
import '../../../helper/objectColor.dart';
import '../../../helper/textStyle.dart';


class BaseButton extends StatelessWidget {
  BaseButton(this.txt, {this.btnColor,this.onPress, this.pading, this.textStyle, this.height, this.width, this.small = false});

  final String txt;
  final Color? btnColor;
  final VoidCallback? onPress;
  final EdgeInsets? pading;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child:Padding(
        padding: pading == null ? EdgeInsets.all(10.0): pading!,
        child:
        InkWell(
          onTap: (){
            if(onPress != null)
              onPress!();
          },
          child:
          Container(
            decoration: BoxDecoration(
              color: btnColor == null ? MyApp.color.base: btnColor ,
              borderRadius: BorderRadius.all(const Radius.circular(10.0)),
            ),
            padding: _paddingElevatedButton(),
            child:Center(
                child:Text(txt,style:_textStyle())
            ),
          ),
        ),
      ),
    );
  }
  TextStyle _textStyle() {
    if(small)
      return Style.h12p(color: white);
    return textStyle == null ?  Style.h4(color: white) : textStyle!;
  }
  EdgeInsets _paddingElevatedButton() {
    return small ?  EdgeInsets.symmetric(vertical:2, horizontal: 5.0) : EdgeInsets.symmetric(vertical:14, horizontal: 7.0);
  }
}