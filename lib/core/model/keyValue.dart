
class KeyValue{
  KeyValue();
  int? index;
  String? key;
  String? value;

  KeyValue.setProperty({this.index,this.value,this.key});
  @override
  KeyValue.fromJson(Map<String, dynamic> json):index = json['index'],key = json['key'],value = json['value'];
  Map<String, dynamic> toJson() =>{'index' : index,'key' : key,'value' : value};
}