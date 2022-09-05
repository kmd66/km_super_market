import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowSpaceBetween extends StatelessWidget {
  RowSpaceBetween(this.obj1, this.obj2);
  final Widget obj1;
  final Widget obj2;

  Widget build(BuildContext context) {
    return
      LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints)
          {
            return Row(children: [
              Container(
                  width: (constraints.maxWidth / 2) - 2.5,
                  margin: EdgeInsets.only(left: 2.5),
                  child:obj1
              ),
              Container(
                  width: (constraints.maxWidth / 2) - 2.5,
                  margin: EdgeInsets.only(right: 2.5),
                  child:
                  Align(
                    alignment: Alignment.centerLeft,
                    child: obj2
                  )
              )
            ],);
          });

  }
}