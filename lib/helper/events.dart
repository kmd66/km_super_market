import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../core/model/message.dart';
import '../core/model/navigation.dart';

class Events {
  StreamController<Message> streamMessage = StreamController<Message>();
  StreamController<Widget> streamDialog = StreamController<Widget>();
  StreamController<String?> streamLoad = StreamController<String?>();
  StreamController<Navigation> streamNavigation = StreamController<Navigation>();
  StreamController<Navigation> streamonWillPopNavigation = StreamController<Navigation>();
  StreamController<bool> streamClosePopupState = StreamController<bool>();
}