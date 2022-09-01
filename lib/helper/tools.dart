import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/model/keyValue.dart';
import '../core/model/message.dart' as msgModel;
import '../main.dart';
import 'events.dart';

class Tools {
  static void showError(dynamic err){
    try{
      if(err['Message'] != null)
        MyApp.events.streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['Message']));
      else if(err['message'] != null)
        MyApp.events.streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['message']));
      else
        MyApp.events.streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'خطای ناشناخته'));
    }
    catch(e){
      MyApp.events.streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'خطای ناشناخته'));
    }
  }
  //
  static void launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url)))
      MyApp.events.streamMessage.add(msgModel.Message.danger(msg: 'اتصال اینترنت خود را برسی کنید'
          '\n Could not launch $url',));
  }

  static void test(String url) async {
    bool b =false;
    if(b.IsNullOrFalse){}
    int? i;
    if(!i.IsNullOrZiro){
      String? s;
      s = i.ToString();
      int r = s.ToInt();
    }

  }

}

extension BoolExtensions on bool? {
  bool get IsNullOrFalse => this == null || !this!;
}

extension IntExtensions on int? {
  bool get IsNullOrZiro => this == null || this == 0 ;
  String ToString() => this == null ? '0': this.toString();
}

extension BigIntExtensions on BigInt? {
}
extension NumExtensions on num? {
  BigInt? ToBigInt()=> this != null? new BigInt.from(this!):null;
}

extension StringExtensions on String? {

  bool get IsNullOrEmpty => this == null || this == '';
  bool get IsNullOrEmptyOrZiro => this == null || this == '' || this == '0';

  String textZiroConvertHyphen()=> this == null || this == '' || this == 'null' || this!.ToSortable() == '0' ? '-':this!;
  String MoneFromat({decimal = 0, endCharacter = ''}) => this == null ? '0':
  "${ num.parse(this!).toStringAsFixed(decimal).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},") } ${endCharacter}" ;

  String stringNotNulll() => this == null ? '':this!;

  int ToInt() => this.IsNullOrEmpty ? 0: int.parse(this!) ;
  DateTime? ToDateTime()=>this != null && this != 'null'?  DateTime.parse(this!):null;
  String? ToSortable()=>  this == null? null: this!.toLowerCase().replaceAll(' ', '');

}

extension UtilListExtension on List{
  groupBy(String key,{dynamic insertObj}) {
    try {
      List<Map<String, dynamic>> result = [];
      List<String> keys = [];

      this.forEach((f) => keys.add(f[key].toString()));

      [...keys.toSet()].forEach((k) {
        List data = [...this.where((e) => e[key].toString() == k.toString())];
        result.add({'Id': k, 'insertObj': insertObj, 'Data': data});
      });

      return result;
    } catch (e, s) {
      return this;
    }
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject?.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}

extension MapExtension on Map<String, num> {
  String ToString(num n )  {
    try{
      var t = this.entries.where((element) => element.value == n).first.key;
      if(t != null)
        return t;
      else
        return 'نامعلوم';
    }
    catch(e){
      return 'نامعلوم';

    }
  }
  num number(String n )  {
    try{
      var t = this.entries.where((element) => element.key == n).first.value;
      if(t != null)
        return t;
      else
        return 0;
    }
    catch(e){
      return 0;

    }
  }

  List<String> ToList()  {
    try{
      List<String> l= [];
      this.entries.forEach((e) {
        l.add(e.key);
      });
      return l;
    }
    catch(e){
      return [];

    }
  }
  List<num> ToListNum()  {
    try{
      List<num> l= [];
      var t = this.entries.forEach((e) => l.add(e.value));
      return l;
    }
    catch(e){
      return [];

    }
  }

  List<KeyValue> ToListKeyValue()  {
    try{
      List<KeyValue> l= [];
      this.entries.toList().asMap().forEach((i, v) {
        l.add(new KeyValue.setProperty(index: i, value: v.key,key: v.value.toString()));
      });
      return l;
    }
    catch(e){
      return [];

    }
  }

  KeyValue modelBykey(String n )  {
    var m = new KeyValue();
    try{
      this.entries.toList().asMap().forEach((i, v) {
        if(v.key == n)
          m = new KeyValue.setProperty(value: v.key,key: v.value.toString(),index: i);
      });
      return m;
    }
    catch(e){
      return m;
    }
  }
  KeyValue modelByValue(num n )  {
    var m = new KeyValue();
    try{
      this.entries.toList().asMap().forEach((i, v) {
        if(v.value == n)
          m = new KeyValue.setProperty(
              value: v.key, key: v.value.toString(), index: i);
      });
      return m;
    }
    catch(e){
      return m;
    }
  }
}