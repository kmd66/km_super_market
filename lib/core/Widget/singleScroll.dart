import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/pages/main/myApp.dart';

class SingleScroll extends StatelessWidget {
  SingleScroll(this.widget);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return
      Scrollbar(
          child:RawScrollbar(
              thumbColor:MyApp.color.shadowBackground(.2),
              radius: Radius.circular(20),
              thickness: 10,
              child:SingleChildScrollView(
                  child:widget
              )
          )
      );
  }
}