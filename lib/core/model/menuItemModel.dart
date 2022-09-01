import 'package:flutter/cupertino.dart';
import 'enums.dart';

class MenuItemModel {

  final AppMenuType type;
  final List<MenuItemModel>? child;
  final String? title;
  final RouteList? route;
  final MenuList? menu;
  final IconData? icon;
  final bool? reghtMenu;
  final String? imgIcon;
  final String? svgIcon;
  final int index;

  MenuItemModel(this.type, {this.child, this.title, this.route, this.menu, this.icon,  this.imgIcon, this.svgIcon, this.reghtMenu = true, this.index = 0});
}