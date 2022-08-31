import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/objectColor.dart';
import '../../main.dart';

class AppBarWidget {
  AppBar build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: ObjectColor.base,
        shadowColor:Colors.transparent,
        title: Text(MyApp.navigator.routeTitle),
        leading: Container(
          margin: const EdgeInsets.only(top: 0, right: 10.0, bottom: 0, left: 10.0),
          child:
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.settings),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>MyApp.navigator.pop(),
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ]
    );
  }
}