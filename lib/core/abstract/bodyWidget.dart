import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/main/myApp.dart';
import '../Widget/getTop.dart';

class BodyWidget extends StatelessWidget {
  final ScrollController scrollController;
  final  GetTop? getTop;
  final  Widget child;

  const BodyWidget({ required this.scrollController, this.getTop, required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scrollbar(
          // isAlwaysShown: true,
          controller: scrollController, // <---- Here, the controller
          child:RawScrollbar(
            controller: scrollController,
            thumbColor:MyApp.color.shadowBackground(.6),
            radius: Radius.circular(20),
            thickness: 5,
            child:
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: scrollController, // <---- Same as the Scrollbar controller
                child:
                Center(
                  child:
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20) ,
                      color: MyApp.color.baseBackground,
                      child:child
                  ),
                )
            ),
          ),
        ),
        getTop!,
      ],
    );
  }
}