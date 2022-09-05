import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/pages/main/myApp.dart';
import '../btn/BaseButton.dart';
import '../hr.dart';
import 'containerBackColor.dart';

class SectionCard extends StatelessWidget {
  SectionCard({this.heder, this.bodyTitle, this.body, this.onPress, this.btnText = 'ادامه', this.btnColor});
  final Widget? heder;
  final Widget? bodyTitle;
  final Widget? body;
  final VoidCallback? onPress;
  final String? btnText;
  final Color? btnColor;

  Widget build(BuildContext context) {
    return
      Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: MyApp.color.baseBorder, width: 1),
            borderRadius: BorderRadius.circular(14),
          ),
          child:Container(
              width: MediaQuery.of(context).size.width - 110,
              padding: EdgeInsets.all(12.0),
              child:
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heder != null?heder!:Container(width: 0,height: 0,),
                    heder != null?Hr():Container(width: 0,height: 0,),
                    Align(
                      alignment: Alignment.topRight,
                      child:bodyTitle != null ?
                      Padding(
                          padding: EdgeInsets.only(bottom: 7.0),
                          child:bodyTitle) :Container(width: 0,height: 0,),
                    ),
                    // Expanded(
                    //   child:
                    ContainerBackColor(body!),
                    // ),
                    onPress != null?
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: BaseButton(
                        btnText!,
                        btnColor: btnColor!=null? btnColor!:MyApp.color.base,
                        pading: EdgeInsets.all(3.0),
                        onPress: (){
                          if(onPress != null)
                            onPress!();
                        },
                        small: true,
                      ),
                    ) :Container(width: 0, height: 0,)

                  ]
              )
          )
      );

  }
}