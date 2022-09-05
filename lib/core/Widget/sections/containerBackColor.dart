import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerBackColor extends StatelessWidget {
  ContainerBackColor(this.obj, {this.margin, this.color});
  final Widget obj;
  final EdgeInsets? margin;
  final Color? color;

  Widget build(BuildContext context) {
    return Container(
        margin: margin != null? margin:EdgeInsets.all(0),
        padding: EdgeInsets.all(12.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: color != null? color : Color.fromRGBO(243, 244, 246, 1),
        ),
        child:obj
    );

  }
}