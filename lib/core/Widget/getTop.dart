import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/main/myApp.dart';

class GetTop extends StatefulWidget {
  GetTop({Key? key, this.scrollController}) :  super(key: key);
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

  _GetTop state = new _GetTop();

  @override
  _GetTop createState() {
    return this.state = new _GetTop();
  }
}

class _GetTop extends State<GetTop>{

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 22,
      left: 20,
      child:
      widget._isShow?
      ElevatedButton(
        onPressed: () =>_animateToTop(),
        child: Icon(Icons.arrow_upward, color: Colors.white,size: 14,),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(18),
          shape: CircleBorder(),
          primary: MyApp.color.base, // <-- Button color
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