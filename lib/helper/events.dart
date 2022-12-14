import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../core/model/enums.dart';
import '../core/model/message.dart';
import '../core/model/navigation.dart';

class Events {
  StreamController<Message> streamMessage = StreamController<Message>();
  StreamController<Widget> streamDialog = StreamController<Widget>();
  StreamController<String?> streamLoad = StreamController<String?>();
  StreamController<NavigationModel> streamNavigation = StreamController<NavigationModel>();
  StreamController<NavigationModel> streamonWillPopNavigation = StreamController<NavigationModel>();
  StreamController<MenuList> streamMenu = StreamController<MenuList>();
  StreamController<LoginType> loginController = StreamController<LoginType>();
}