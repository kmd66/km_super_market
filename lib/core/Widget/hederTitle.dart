import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/pages/main/myApp.dart';

import '../../helper/objectColor.dart';
import '../../helper/textStyle.dart';

class HederTitle extends StatelessWidget {
  const HederTitle({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return
      Container(
        width:  MediaQuery.of(context).size.width ,
        height: 122 ,
        decoration: BoxDecoration(
          color: MyApp.color.base,
        ),
        child: Center(child: Text(title,style: Style.h3(color:white, fontWeight: FontWeight.w400 ),),),
      );
  }
}