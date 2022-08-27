import 'package:flutter/material.dart';

import '../core/model/enums.dart';

class MessageColor {
  static type(MessageType type) {
    if(type == MessageType.Info)
      return Colors.lightGreen;
    if(type == MessageType.Danger)
      return Colors.redAccent;
    if(type == MessageType.Warning)
      return Colors.amber;
    return Colors.lightBlueAccent;
  }
  static icon(  MessageType type) {
    if(type == MessageType.Info)
      return Icons.info_outline;
    if(type == MessageType.Danger)
      return Icons.do_disturb_alt_outlined;
    if(type == MessageType.Warning)
      return Icons.warning_amber_outlined;
    return Icons.mail_outlined;
  }
}