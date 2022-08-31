import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/objectColor.dart';
import '../../main.dart';
import '../Widget/bottomNavigationBarButton.dart';
import '../Widget/showObj.dart';
import '../model/enums.dart';

class NavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return
    ShowObj(
      obj:Container(
        constraints: BoxConstraints(minWidth: 320, maxWidth: MyApp.propertis.maxWidth, ),
        margin: const EdgeInsets.only(left : 14.0,bottom: 14.0,right: 14.0,top: 5.0),
        decoration: BoxDecoration(
          color: ObjectColor.base,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:Row(
          children: listmenu(context),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }

  List<Widget> listmenu(BuildContext context) {
    List<Widget> list = [];
    MyApp.menus.items.map((x) =>
    {
      if(x.type == AppMenuType.Nav )
        list.add(
            BottomNavigationBarButton(
                btnIcon: x.svgIcon!,
                title: x.title!,
                onPress: () {

                }
            )
        )
    }).toList();
    return list;
  }
}