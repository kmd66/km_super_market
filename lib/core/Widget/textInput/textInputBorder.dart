import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/helper/objectColor.dart';
import '../../../helper/textStyle.dart';
import '../../../helper/tools.dart';
import '../../../main.dart';

class TextInputBorder extends StatelessWidget {
  TextInputBorder(this.label, {
    this.obscureText = false,
    TextInputType textInputType = TextInputType.none,
    this.model, this.modelLabel, this.onChange, this.hintLabel, this.maxLength, this.focusNode, this.textDirection = TextDirection.rtl, this.enabled = true
  })  :
        this.textInputType=textInputType != TextInputType.none ?textInputType :TextInputType.text;

  final String label;
  final String? hintLabel;
  final dynamic model;
  final String? modelLabel;
  final void Function(String)? onChange;
  final bool obscureText;
  final TextInputType textInputType;
  final int? maxLength;
  final TextDirection textDirection;
  final FocusNode? focusNode;
  final _controller = TextEditingController();
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    _controller.text = model != null ?  model : '';
    return
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(children: [
            !label.IsNullOrEmpty?
            Container(
              width:  MediaQuery.of(context).size.width ,
              child:
              Padding(
                padding: const EdgeInsets.all(5.0),
                child:Text(label,style: Style.h4(fontWeight:FontWeight.bold),),
              ),
            )
                :Container(width: 0,height: 0,),
            PhysicalModel(
              borderRadius: BorderRadius.circular(10),
              color: MyApp.color.baseBorder,
              elevation:10.0,
              shadowColor: MyApp.color.textInput_Background(false),//dark,
              child:
              Directionality(
                textDirection: textInputType == TextInputType.number? TextDirection.ltr : textDirection,
                child: TextField(
                  enabled: enabled,
                  maxLength: maxLength,
                  autofocus:true,
                  controller: _controller,
                  focusNode:focusNode,
                  obscureText: obscureText,
                  onChanged: (value)=>onChange??(value) ,
                  keyboardType: textInputType,
                  inputFormatters: [
                    textInputType == TextInputType.number?
                    FilteringTextInputFormatter.digitsOnly: FilteringTextInputFormatter.singleLineFormatter
                  ],
                  style: TextStyle(
                      fontFamily: 'IRANSansX',
                      color: MyApp.color.baseTextColor),
                  decoration: InputDecoration(
                    counterText: "",
                    focusColor: Colors.amber,
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: MyApp.color.base, width: 2.0),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:  BorderSide(color: MyApp.color.baseBorder, width: 2.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    )
                    ,filled: true,
                    fillColor: MyApp.color.textInput_Background(enabled),
                    hintText: hintLabel != null ? hintLabel : '',
                    hintStyle: Style.h5(color: MyApp.color.baseBorder),
                  ),
                ),
              ),
            ),
          ])
      );
  }
}