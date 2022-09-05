import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/pages/main/myApp.dart';

import '../../../helper/textStyle.dart';

class BaseBorderButton extends StatelessWidget {
  BaseBorderButton(this.txt, {this.btnColor,this.onPress, this.pading, this.textStyle, this.height, this.width, this.small = false, this.icon});

  final String txt;
  final Color? btnColor;
  final VoidCallback? onPress;
  final EdgeInsets? pading;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final bool small;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Padding(
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
              color: Colors.transparent,
              borderRadius: BorderRadius.all(const Radius.circular(10.0)),
              border: Border.all(
                color: btnColor == null ? MyApp.color.base: btnColor!,
                width: 1,
              ),
            ),
            padding: _paddingElevatedButton(),
            child:_text(),
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    var c =  btnColor == null ? MyApp.color.base: btnColor!;
    if(small)
      return Style.h12p(color: c, fontWeight: FontWeight.bold);
    return textStyle == null ?  Style.h4(color:c, fontWeight: FontWeight.bold) : textStyle!;
  }
  EdgeInsets _paddingElevatedButton() {
    return small ?  EdgeInsets.symmetric(vertical:2, horizontal: 5.0) : EdgeInsets.symmetric(vertical:14, horizontal: 7.0);
  }
  Widget _text() {
    if(icon != null)
      return
        Center(
            child:Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child:
                  Icon(icon,color: btnColor == null ? MyApp.color.base: btnColor,),
                ),
                Text(txt,style:_textStyle())
              ],
            )
        );

    return Center(
        child:Text(txt,style:_textStyle())
    );
  }
}