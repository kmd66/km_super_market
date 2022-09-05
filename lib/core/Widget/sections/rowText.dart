import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../helper/textStyle.dart';

class RowTex extends StatelessWidget {
  RowTex(this.text1, this.text2,{this.maxLines,this.height = 2.2});
  final String text1;
  final String text2;
  final double height;
  final int? maxLines;

  Widget build(BuildContext context) {

    return
      RichText(
        maxLines: maxLines,
        text: TextSpan(

          children: [
            TextSpan(
              text: text1 !=null ? '$text1:':'',
              style: Style.h12p(fontWeight: FontWeight.bold, height: height),
            ),
            TextSpan(
                text: text2 !=null ? ' $text2':'',
                style: Style.h12p(height: height)
            ),
          ],
        ),
      );

  }
}