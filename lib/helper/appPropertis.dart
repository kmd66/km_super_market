import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../core/model/enums.dart';
import '../core/model/navigation.dart';

const marginBody = EdgeInsets.symmetric(horizontal: 0.0,vertical: 15.0);
const paddingBody =  EdgeInsets.all(15.0);
const double maxWidth = 1024.0;
const double bodyWidth = maxWidth;

class AppPropertis {
    static RouteList currentRoute = RouteList.HomePage;
  static StateType currentState = StateType.Main;
  static List<Navigation> navigations = [Navigation(route: RouteList.HomePage)];

  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  static dynamic currentUsers;

  static dynamic currentUser;
  static dynamic accessToken;

  static dynamic objectToken() =>
      accessToken != null ? json.decode(accessToken) : null;

  static dynamic Authorization() =>
      accessToken != null ? 'Bearer ${json.decode(accessToken)['access_token']}' : null;

  static String appVersion = "";
}