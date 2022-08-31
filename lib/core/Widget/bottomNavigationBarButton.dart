import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/objectColor.dart';
import '../../helper/textStyle.dart';
import '../../main.dart';

//ignore: must_be_immutable
class BottomNavigationBarButton extends StatelessWidget {
  BottomNavigationBarButton({
   this.isSelect = false,
    required this.btnIcon,
    required this.title,
    required this.onPress
  });

  final String btnIcon;
  bool isSelect;
  final VoidCallback onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return
      _isSelect(context)?
      selectContainer(context):
      selectFalseContainer(context);
  }

  bool _isSelect(BuildContext context) {
    if(isSelect == false && title == MyApp.navigator.routeTitle)
      isSelect = true;
    return isSelect;
  }

  Widget selectContainer(BuildContext context) {
    return  Stack(children: [
      Container(
        transform: Matrix4.translationValues(3.0, -5.0, 0.0),
        height: 38,
        width: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36), bottomRight: Radius.circular(36)),
          color: ObjectColor.baseBackground,
        ),
      ),
      Container(
        transform: Matrix4.translationValues(0.0, -30, 0.0),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ObjectColor.linkColor,
          // border: Border.all(width: 5, color:ObjectColor.baseBackground)
        ),
        child:
        Center(
          child:
          btnIcon !=null?
          SvgPicture.asset(btnIcon ,
            height: 27,
            width: 27,
          ):
          Icon(Icons.home,
            color: ObjectColor.baseIcon,
          ),
        ),

      )
    ]);
  }
  Widget selectFalseContainer(BuildContext context) {

    return
      Container(
          height: 60,
          child:InkWell(
            onTap: (){
              if(onPress != null) {
                onPress();
              }
            },
            child:
            Column(

                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child:
                    btnIcon !=null?
                    SvgPicture.asset(btnIcon ,
                      height: 27,
                      width: 27,
                    ):
                    Icon(Icons.home,
                      color: ObjectColor.baseIcon,
                    ),
                  ) ,
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child:
                    Center(
                        child:
                        Text(title,style: Style.h6(color: Color.fromRGBO(255, 255, 255, 0.6)))
                    ),
                  ),
                ]),
          )
      );
  }
}