
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/abstract/baseNavigationWidget.dart';
import '../core/model/enums.dart';
import '../core/model/navigation.dart';
import 'main/myApp.dart';

class HomePage extends BaseStatefulWidget<_HomePage> {
  HomePage(GlobalKey<NavigatorState> key) : super(key);

  @override
  _HomePage createState(){
    state = _HomePage();
    return state!;
  }
}

class _HomePage extends BaseNavigationWidget {
  _HomePage() : super(ChengState(StateType.Main), RouteList.HomePage);
  @override
  Widget stateBuild(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        child: const Text('Open route'),
        onPressed: () {
          MyApp.navigator.push(route: RouteList.AboutPage);
        },
      ),
      ElevatedButton(
        onPressed: () {
          MyApp.navigator.pop();
        },
        child: const Text('Go back!'),
      ),
    ]);
  }
}