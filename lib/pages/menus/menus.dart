import 'package:flutter/material.dart';
import '../../core/model/enums.dart';
import '../../core/model/menuItemModel.dart';

class Menus  {
  List<MenuItemModel> items = [
    MenuItemModel(AppMenuType.Nav, index: 1,
        title: 'صفحه اصلی',
        route: RouteList.HomePage,
        svgIcon: 'assets/svg/home.svg'),
    MenuItemModel(AppMenuType.Nav, index: 2,
        title: 'درباره ما',
        route: RouteList.AboutPage,
        svgIcon: 'assets/svg/bag.svg'),
    MenuItemModel(AppMenuType.Nav, index: 3,
        title: 'ورود',
        route: RouteList.LoginPage,
        svgIcon: 'assets/svg/search.svg'),
    MenuItemModel(AppMenuType.Nav, index: 4,
        title: 'منو',
        menu: MenuList.Main,
        svgIcon: 'assets/svg/menu.svg'),
    MenuItemModel(AppMenuType.Sid, index: 6,
        title: 'پروفایل',
        route: RouteList.ProfilePage,
        icon: Icons.verified_user),

  ];
}
