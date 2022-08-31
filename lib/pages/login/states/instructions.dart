// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:kama_aro_karmandiran/helper/objectColor.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/baseButton.dart';
// import 'package:kama_aro_karmandiran/page/login/states/tab1.dart';
// import 'package:kama_aro_karmandiran/page/login/states/tab2.dart';
// import 'package:kama_aro_karmandiran/page/login/states/tab3.dart';
// import 'package:kama_aro_karmandiran/core/Widgets/baseBorderButton.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:kama_aro_karmandiran/core/model/enums.dart';
// import 'package:kama_aro_karmandiran/helper/appPropertis.dart';
// import 'package:kama_aro_karmandiran/page/main/events.dart';
// import '../obj.dart';
//
//
// class Instructions extends StatefulWidget {
//   Instructions(this.obj);
//   final Obj obj;
//
//   @override
//   State<Instructions> createState() => _Instructions();
// }
//
// class _Instructions extends State<Instructions> with SingleTickerProviderStateMixin{
//   TabController _tabController;
//
//   @override
//   void initState()
//   {
//     super.initState();
//     _tabController = TabController(
//       initialIndex: 0,
//       length: 3,
//       vsync: this,
//     );
//     _tabController.addListener(_handleTabIndex);
//   }
//   @override
//   void dispose() {
//     _tabController.removeListener(_handleTabIndex);
//     _tabController.dispose();
//     super.dispose();
//   }
//   void _handleTabIndex() {
//     setState(() {});
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body:
//       Container(
//         padding: EdgeInsets.all(14.0),
//         child: Stack(
//           children: [
//             Container(
//               margin: EdgeInsets.only(bottom: 60),
//               child:
//               TabBarView(
//                 controller: _tabController,
//                 children:  [
//                   Tab1(),
//                   Tab2(),
//                   Tab3(),
//                 ],
//               ),
//             ),
//
//             btn(context)
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget circleContainer(int i) {
//     return  Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
//       width: i == _tabController.index? 15: 10,
//       height: 10,
//       decoration: BoxDecoration(
//           borderRadius: i == _tabController.index? BorderRadius.circular(5):null,
//           shape: i == _tabController.index? BoxShape.rectangle: BoxShape.circle,
//           color:  i == _tabController.index? linkColor:inactiveColor
//       ),
//     );
//   }
//
//   Widget btn(BuildContext context) {
//     return
//       Align(
//           alignment: Alignment.bottomCenter,
//           child:
//           LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints)
//               {
//                 return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           circleContainer(0),
//                           circleContainer(1),
//                           circleContainer(2),
//                         ],
//                       ),
//                       Row(children: [
//                         _tabController.index != 0?
//                         BaseBorderButton(
//                             'قبلی',
//                             height: 55,
//                             width:constraints.maxWidth /2 ,
//                             pading: EdgeInsets.all(3.0),
//                             onPress:(){
//                               _tabController.animateTo(_tabController.index - 1);
//                             }
//                         )
//                             :Container(width: 0,height: 0,),
//                         BaseButton(
//                             'بعدی',
//                             height: 55,
//                             width:_tabController.index == 0? constraints.maxWidth :constraints.maxWidth /2 ,
//                             pading: EdgeInsets.all(3.0),
//                             onPress:(){
//                               if(_tabController.index != 2)
//                                 _tabController.animateTo(_tabController.index + 1);
//                               else
//                                 checkUser();
//                             }
//                         ),
//                       ])
//                     ]);
//
//               }
//           )
//       );
//   }
//
//   Future<void> checkUser() async {
//     SharedPreferences local = await SharedPreferences.getInstance();
//     local.setString("currentUser", jsonEncode(AppPropertis.currentUser));
//     local.setString("accessToken", jsonEncode(AppPropertis.accessToken));
//     loginController.add(LoginType.Enter);
//   }
// }