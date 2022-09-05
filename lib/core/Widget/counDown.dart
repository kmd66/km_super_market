import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helper/textStyle.dart';

//ignore: must_be_immutable
class CounDown extends StatefulWidget {
  CounDown({required this.seconds,required this.label});

  int seconds;
  String label;

  Timer? _timer;
  int _start = 0;
  _CounDown state = new _CounDown();

  void reset() {
    _timer?.cancel();
    start();
  }
  void start() {
    _start = seconds;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          state.setState(() {
            timer.cancel();
          });
        } else {
          state.setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  _CounDown createState() {
    return this.state = new _CounDown();
  }

}

class _CounDown extends State<CounDown> {


  @override
  void initState() {
    widget.start();
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    if(widget != null && widget._timer != null)
      widget._timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('${widget.label}  ${widget._start.toString()} ثانیه',style: Style.h5());
  }
}