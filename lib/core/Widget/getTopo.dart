import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj/helper/objectColor.dart';

class GetTopo extends StatefulWidget {
  GetTopo({Key? key, this.scrollController}) :  super(key: key);
  final ScrollController? scrollController;

  bool _isShow = false;

  void scroll( double pixel) {
    if (pixel > 110) {
      if (!_isShow)
        state.setState(()=> _isShow = true);
    }
    else{
      if (_isShow)
        state.setState(()=> _isShow = false);
    }
  }

  _GetTopo state = new _GetTopo();

  @override
  _GetTopo createState() {
    return this.state = new _GetTopo();
  }
}

class _GetTopo extends State<GetTopo>{

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      child:
      widget._isShow?
      ElevatedButton(
        onPressed: () =>_animateToTop(),
        child: Icon(Icons.arrow_upward, color: Colors.white),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
          primary: ObjectColor.base, // <-- Button color
          onPrimary: Colors.red, // <-- Splash color
        ),
      ):Container(width: 0,height: 0,),
    );
  }

  void _animateToTop() {
    widget.scrollController?.animateTo(
      0.0,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}