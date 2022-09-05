import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../helper/textStyle.dart';

class RowTexSpaceBetween extends StatelessWidget {
  RowTexSpaceBetween(this.text1, this.text2, {this.color, this.style});
  final String text1;
  final String text2;
  final Color? color;
  final TextStyle? style;

  Widget build(BuildContext context) {
    return
      LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints)
          {
            return Row(children: [
              Container(
                  width: (constraints.maxWidth / 2) - 2.5,
                  margin: EdgeInsets.only(left: 2.5),
                  child:
                  Text(
                    text1,
                    style: style != null? style: Style.h12p(height: 2.2,color: color),
                      overflow: TextOverflow.ellipsis
                  )
              ),
              Container(
                  width: (constraints.maxWidth / 2) - 2.5,
                  margin: EdgeInsets.only(right: 2.5),
                  child:
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      text2,
                      style: style != null? style: Style.h12p(fontWeight: FontWeight.bold, height: 2.2,color: color),
                        overflow: TextOverflow.ellipsis
                    ),
                  )
              )
            ],);
          });

  }
}