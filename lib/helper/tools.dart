import 'package:url_launcher/url_launcher.dart';
import '../core/model/message.dart' as msgModel;
import 'events.dart';

class Tools {
  static void showError(dynamic err){
    try{
      if(err['Message'] != null)
        streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['Message']));
      else if(err['message'] != null)
        streamMessage.add(msgModel.Message.danger(respite: 3,msg: err['message']));
      else
        streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'خطای ناشناخته'));
    }
    catch(e){
      streamMessage.add(msgModel.Message.danger(respite: 3,msg: 'خطای ناشناخته'));
    }
  }
  //
  static void launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url)))
      streamMessage.add(msgModel.Message.danger(msg: 'اتصال اینترنت خود را برسی کنید'
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

  String? toSortable()=>  this == null? null: this!.toLowerCase().replaceAll(' ', '');
  String textZiroConvertHyphen()=> this == null || this == '' || this == 'null' || this!.toSortable() == '0' ? '-':this!;
  String MoneFromat({decimal = 0, endCharacter = ''}) => this == null ? '0':
  "${ num.parse(this!).toStringAsFixed(decimal).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},") } ${endCharacter}" ;

  String stringNotNulll() => this == null ? '':this!;
  int ToInt() => this.IsNullOrEmpty ? 0: int.parse(this!) ;

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