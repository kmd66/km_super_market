import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../core/model/enums.dart';
import '../core/model/navigation.dart';


class AppPropertis {

  RouteList currentRoute = RouteList.HomePage;
  StateType currentState = StateType.Main;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  EdgeInsets marginBody = EdgeInsets.symmetric(horizontal: 0.0,vertical: 15.0);
  EdgeInsets paddingBody =  EdgeInsets.all(15.0);
  double maxWidth = 1024.0;
  double get bodyWidth => maxWidth;

  dynamic currentUsers;

  dynamic currentUser;
  dynamic accessToken;

  dynamic objectToken() =>
      accessToken != null ? json.decode(accessToken) : null;

  dynamic Authorization() =>
      accessToken != null ? 'Bearer ${json.decode(accessToken)['access_token']}' : null;

  String appVersion = "";

}