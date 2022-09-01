import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helper/objectColor.dart';
import '../../main.dart';
import '../Widget/btn/bottomNavigationBarButton.dart';
import '../Widget/showObj.dart';
import '../model/enums.dart';
import '../model/navigationBarModel.dart';

class NavigationBarWidget extends StatefulWidget implements PreferredSizeWidget{
  NavigationBarWidget({Key? key, required this.scrollController}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  final ScrollController scrollController;

  _NavigationBar state = new _NavigationBar();

  @override
  _NavigationBar createState()=> this.state = new _NavigationBar();
}

class _NavigationBar extends State<NavigationBarWidget>{

  final model =NavigationBarModel();

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    startTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
    widget.scrollController.addListener(() {

      model.scrollTop = false;

      if(!model.scrollListener)
        return;

      if(!model.isShow) {
        model.scrollHide = 3;
        setState(() => model.isShow = true);
      }

      if(!model.scrollTop)
        model.scrollHide = 3;

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return
    ShowObj(
      isShow: model.isShow,
      animat: true,
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
                onPress: (){
                  x.route !=null ? MyApp.navigator.push(x.route!):MyApp.navigator.setMenu(x.menu!);
                }
            )
        )
    }).toList();
    return list;
  }

   void startTimer() {
    if(!model.timer)
      return;

     if(!model.scrollListener){
       model.scrollListener= true;
       Future.delayed(const Duration(milliseconds: 1500), ()=>startTimer());
      return ;
      }
     if(model.scrollTop)
       model.scrollHide = 3;
     else {
       if(model.scrollHide == 0){
         setState(()=> model.isShow = false);
         model.scrollListener= false;
         // Future.delayed(const Duration(milliseconds: 1000), ()=>);
       }
       else model.scrollHide--;
     }

     Future.delayed(const Duration(milliseconds: 1000), ()=>startTimer());
   }

  @override
  void dispose() {
    model.timer = false;
    super.dispose();
  }
}