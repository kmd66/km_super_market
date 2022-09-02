import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/textStyle.dart';
import '../../pages/main/myApp.dart';

//ignore: must_be_immutable
class AppMenuItem extends StatefulWidget {
  AppMenuItem({
    this.icon = Icons.home,
    this.label='',
    required this.onPress,
    this.margin: const EdgeInsets.all(0.0),
    this.svgIcon,
  });

  final VoidCallback onPress;
  final String? label;
  final IconData? icon;
  final String? svgIcon;
  final EdgeInsets margin;
  bool _isHovered = false;

  @override
  _MenuItem createState() => _MenuItem();
}

class _MenuItem extends State<AppMenuItem> {

  void classSetState(){
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin:widget.margin,
        child: InkWell(
            onTap: (){

              if(widget.onPress != null)
                widget.onPress();
            },
            onHover: (value) {
              setState(() {
                widget._isHovered = value;
              });
            },
            child:Column(children: [
              Container(
                  padding:  const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color:widget._isHovered == true ?MyApp.color.shadowBackground(.1):Colors.transparent,
                  ),
                  child:Column(children: [
                    Row(
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyApp.color.shadowBackground(.1)
                          ),
                          child: Center(
                            child:_icon(context),
                          ) ,
                        )
                        ,
                        Container(margin: const EdgeInsets.only(left: 10.0)
                        ),
                        Text(widget.label!,style: Style.h4()),
                      ],
                    ),
                  ],)
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(color:MyApp.color.baseBorder,),
              ),
            ],)
        ),) ;
  }

  Widget _icon(BuildContext context) {
    return widget.svgIcon != null ?
    SvgPicture.asset(widget.svgIcon! ,
      height: 22,
      width: 22,
      color: MyApp.color.base,
    ):
    Icon(
      widget.icon,
      size:22,
      color: MyApp.color.base,
    );
  }
}