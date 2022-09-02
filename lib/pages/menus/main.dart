import 'package:flutter/material.dart';
import '../../core/Widget/appMenuItem.dart';
import '../../core/abstract/baseMenuWidget.dart';
import '../../core/model/enums.dart';
import '../../helper/textStyle.dart';
import '../main/myApp.dart';

class MainMenuWidget extends StatefulWidget {
  @override
  _MainWidgetWidget createState() => _MainWidgetWidget();
}

class _MainWidgetWidget extends BaseMenuWidget<MainMenuWidget> {
  _MainWidgetWidget() : super('منو',true);
  final double size = 100;
  final double margin = 12;

  void itemPresseRoute (RouteList route) {
    close();
    MyApp.navigator.push(route: route);
  }

  @override
  Widget stateBuild(BuildContext context) {
    return
      Stack(children: [

        Container(
            height:80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: MyApp.color.base,
            )
        ),
        Center(child:
        Container(
          width:MyApp.propertis.bodyWidth,
          margin: EdgeInsets.only(top: 80),
          child:
          Column(
            children: [
              Container(
                transform: Matrix4.translationValues(0.0, -60, 0.0),
                child:
                ClipOval(
                  child: _img(context),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -50, 0.0),
                child: Text('اسم و فامیل',style: Style.h4()),
              ),
              Column(children:listmenu(context),),
              AppMenuItem(label: 'خروج',margin:const EdgeInsets.only(top: 40), icon: Icons.exit_to_app,
                  onPress:()
                  {
                    close();
                    // loginController.add(LoginType.Exit);
                    MyApp.navigator.list =[];
                  }
              ),
            ],
          ),
        ),)
      ],);
  }
  List<Widget> listmenu(BuildContext context) {
    List<Widget> list = [];
    var menus =MyApp.menus.items;
    menus.sort((a, b) =>  a.index.compareTo(b.index));
    menus.map((x) =>
    {
      if(x.route != null )
        list.add(
            AppMenuItem(
                label: x.title,
                svgIcon: x.svgIcon,
                icon: x.icon,
                onPress: ()=> itemPresseRoute(x.route!)
            )
        )
    }).toList();
    return list;
  }
  Widget _img(BuildContext context) {
    return
      Image.asset('assets/img/profile_picture.jpg',
        height: 120,
        width: 120,
        fit: BoxFit.fill,
      );
  }

}