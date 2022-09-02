import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../pages/main/myApp.dart';
import '../model/enums.dart';

class AppBarWidget {
  AppBar build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: MyApp.color.base,
        shadowColor:Colors.transparent,
        title: Text(MyApp.navigator.routeTitle),
        leading: Container(
          margin: const EdgeInsets.only(top: 0, right: 10.0, bottom: 0, left: 10.0),
          child:
          IconButton(
            onPressed: ()=>MyApp.navigator.setMenu(MenuList.Setting),
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