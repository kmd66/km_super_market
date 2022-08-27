import 'package:flutter/cupertino.dart';
import 'enums.dart';

class Message{
  final MessageType type ;
  final int respite ;
  final String title;
  final String msg;
  final VoidCallback? onOk;
  Message({
    this.type = MessageType.Message,
    this.respite = 0,
    this.title = 'پیام',
    this.msg = '',
    this.onOk,
  });


  Message.danger({
    int respite = 0,String title = 'خطر', String msg = '', this.onOk,
  }):title = title,msg = msg,respite = respite,type= MessageType.Danger;
  Message.warning({
    int respite = 0,String title = 'هشدار', String msg = '', this.onOk,
  }):title = title,msg = msg,respite = respite,type= MessageType.Warning;
  Message.info({
    int respite = 0,String title = 'پیام', String msg = '', this.onOk,
  }):title = title,msg = msg,respite = respite,type= MessageType.Info;
}
