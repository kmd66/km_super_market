import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../pages/main/myApp.dart';
import '../../../helper/textStyle.dart';

class Card1 extends StatelessWidget {
  Card1({required this.img, required this.text});
  final String img;
  final String text;

  Widget build(BuildContext context) {
    return   Card(
        color:MyApp.color.cardBackground ,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyApp.color.baseBorder, width: 1),
          borderRadius: BorderRadius.circular(14),
        ),
        child:Container(
            width: 200,
            padding: EdgeInsets.all(12.0),
            child:
            Column(children: [
              Image.asset(img,
                height: 150,
                width: 150,
                fit: BoxFit.fill,
              ),
              Text(text, maxLines: 1,style: Style.h5(),)
            ])
        )
    );

  }
}