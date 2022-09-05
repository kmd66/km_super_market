import 'package:flutter/material.dart';
import '../../core/model/enums.dart';
import '../../core/model/menuItemModel.dart';
import '../../helper/appFont.dart';

class Menus  {
  List<MenuItemModel> items = [
    MenuItemModel(AppMenuType.Nav, index: 1,
        title: 'صفحه اصلی',
        route: RouteList.HomePage,
        icon: AppFont.home1),
    MenuItemModel(AppMenuType.Nav, index: 2,
        title: 'درباره ما',
        route: RouteList.AboutPage,
        icon: AppFont.bag1),
    MenuItemModel(AppMenuType.Nav, index: 3,
        title: 'پروفایل',
        route: RouteList.ProfilePage,
        icon: AppFont.user1),
    MenuItemModel(AppMenuType.Nav, index: 4,
        title: 'منو',
        menu: MenuList.Main,
        icon: Icons.menu),

  ];
}
