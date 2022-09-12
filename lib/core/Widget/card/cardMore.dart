import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../helper/textStyle.dart';
import '../../../pages/main/myApp.dart';

class CardMore extends StatelessWidget {
  CardMore({this.text = 'موارد بیشتر'});
  final String text;

  Widget build(BuildContext context)  {
    return
      Card(
          color:MyApp.color.cardBackground ,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: MyApp.color.baseBorder, width: 1),
            borderRadius: BorderRadius.circular(14),
          ),
          child:Container(
              width: 110,
              padding: EdgeInsets.all(12.0),
              child: Center(child:
              Text(text, maxLines: 1,style: Style.h4(color: MyApp.color.linkColor),),)
          )
      );
  }
}