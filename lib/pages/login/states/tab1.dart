import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/Widget/singleScroll.dart';
import '../../../helper/textStyle.dart';
import '../../main/myApp.dart';

class Tab1 extends StatelessWidget{
  Widget build(BuildContext context) {
    return
      SingleScroll(
          Column(children: [
            Container(
                child:Stack(children: [
                  Container(
                    height: 325,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: MyApp.color.baseBorder
                    ),
                  ),
                  Column(children: [
                    Center(child:Container(
                        margin: EdgeInsets.only(top: 50.0,bottom: 40),
                        child:Text(
                          'tab 1 title',
                          style:  Style.h2(color: MyApp.color.base,fontWeight: FontWeight.bold ),
                        )
                    ),
                    ),
                    Center(child:Image.asset('assets/img/profile_picture.jpg' ,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                    )
                  ])
                ],)
            ),

            Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 14.0),
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child:Text(
                  '1. لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله',
                  style:  Style.h4(),
                  textAlign: TextAlign.center,
                )
            )
          ])
      );
  }

}
