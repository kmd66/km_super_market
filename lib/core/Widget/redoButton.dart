import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/objectColor.dart';
import '../../helper/textStyle.dart';
import '../../main.dart';

//ignore: must_be_immutable
class RedoButton extends StatefulWidget {
  RedoButton({
    bool checked = false,
    IconData btnIcon = Icons.home,
    String label='',
    margin: const EdgeInsets.all(0.0),
    var onPress,
    var value,
  }){
    this.label = label;
    this.checked =checked;
    this.onPress = onPress;
    this.margin = margin;
    this.value = value;
  }
  void Function(dynamic)?onPress;
  String label='tex';
  bool checked = false;
  bool _isHovered = false;
  var margin;
  var value;
  var _redoButton =_RedoButton();

  Function? classSetState(){
    _redoButton.classSetState();
    return null;
  }

  @override
  _RedoButton createState() => _redoButton;
}

class _RedoButton extends State<RedoButton> {

  void classSetState(){
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          setState(() {
            widget.checked = !widget.checked;
          });

          if(widget.onPress != null)
            widget.onPress!(widget.value);
        },
        onHover: (value) {
          setState(() {
            widget._isHovered = value;
          });
        },
        child:
        Container(
          margin:widget.margin,
          decoration: BoxDecoration(
            color: widget.checked == true? MyApp.color.shadowBackground(.2):
            widget._isHovered == true ?MyApp.color.shadowBackground(.1):Colors.transparent,
            borderRadius: BorderRadius.all(const Radius.circular(15.0)),
          ),
          child:
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                  (widget.checked == true || widget._isHovered == true)?
                  MyApp.color.base:
                  Colors.transparent,
                ),
                child: Center(
                  child:
                  Icon(
                    widget.checked == true?
                    Icons.check:
                    Icons.brightness_1_outlined,
                    size:18,
                    color: MyApp.color.baseIcon,
                  ),
                ) ,
              )
              ,
              Container(margin: const EdgeInsets.only(left: 10.0)
              ),
              Text(widget.label,style: Style.h4())
            ],
          ),
        )
    );
  }
}