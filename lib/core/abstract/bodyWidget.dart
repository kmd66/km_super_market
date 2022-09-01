import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/objectColor.dart';
import '../../main.dart';
import '../Widget/getTopo.dart';

class BodyWidget extends StatelessWidget {
  final ScrollController scrollController;
  final  GetTopo? getTopo;
  final  Widget child;

  const BodyWidget({ required this.scrollController, this.getTopo, required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scrollbar(
          // isAlwaysShown: true,
          controller: scrollController, // <---- Here, the controller
          child:RawScrollbar(
            controller: scrollController,
            thumbColor:ObjectColor.shadowBackground(.6),
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
                      color: ObjectColor.baseBackground,
                      child:child
                  ),
                )
            ),
          ),
        ),
        getTopo!,
      ],
    );
  }
}