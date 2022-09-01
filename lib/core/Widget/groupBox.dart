import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/core/Widget/redoButton.dart';


//ignore: must_be_immutable
class GroupBox extends StatefulWidget {
  GroupBox({
    List<RedoButton>? listRedoButton,
    var value,
    label ='',
    this.setState = false,
    var onChange
  }){
    this.onChange = onChange;
    this.value = value;
    this.label =label;
    if(listRedoButton !=null) {
      this.listRedoButton = listRedoButton;

      for( RedoButton obj in listRedoButton)
      {
        if(obj.value == this.value)
          obj.checked = true;
        else
          obj.checked = false;

        obj.onPress = (dynamic){
          _onChange(dynamic);
        };
      }
    }
    else
      listRedoButton = [];
  }

  List<RedoButton>? listRedoButton ;
  String? label;
  Function(dynamic)? onChange;
  dynamic? value;
  var _groupBox =_GroupBox();
  bool? setState;

  Function? _onChange(dynamic){
    value = dynamic;
    if(setState == true)
      _groupBox.classSetState();
    if(onChange != null)
      return onChange!(value);
    return null;
  }

  @override
  _GroupBox createState() => _groupBox;
}

class _GroupBox extends State<GroupBox> {

  void classSetState(){
    setState(() {
      for( RedoButton obj in widget.listRedoButton!)
      {
        if(obj.value == widget.value)
          obj.checked = true;
        else
          obj.checked = false;
        obj.classSetState();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount:  widget.listRedoButton!.length,
      itemBuilder: (context, index) {
        return widget.listRedoButton![index];
      },
    );
  }
}