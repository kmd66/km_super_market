abstract class Model {Map<String, dynamic> toJson();}
class Token extends Model{
  // ignore: non_constant_identifier_names
  int? LoginType = 8;
  // ignore: non_constant_identifier_names
  String? Username;
  // ignore: non_constant_identifier_names
  String? Password;
  // ignore: non_constant_identifier_names
  String? SecurityStamp;
  // ignore: non_constant_identifier_names
  String? CellPhone;
  // ignore: non_constant_identifier_names
  String? Grant_type = 'password';

  String? ClientId = 'AppStrings.clientId';
  // ignore: non_constant_identifier_names
  int? ID;

  Token();
  // ignore: non_constant_identifier_names
  Token.setProperty({this.Username,this.Password,this.CellPhone,this.ID,this.LoginType,this.Grant_type});
  @override
  Token.fromJson(Map<String, dynamic> json):Username = json['Username'],Password = json['Password'],SecurityStamp = json['SecurityStamp'],CellPhone = json['CellPhone'],ID = json['ID'],Grant_type = json['Grant_type'],LoginType = json['LoginType'],ClientId = json['ClientId'];
  Map<String, dynamic> toJson() =>{'Username' : Username,'Password' : Password,'SecurityStamp' : SecurityStamp,'CellPhone' : CellPhone,'ID' : ID,'Grant_type' : Grant_type,'LoginType' : LoginType,'ClientId' : ClientId};
}
class GetRefreshTokenVM extends Model{
  // ignore: non_constant_identifier_names
  String? client_id;
  // ignore: non_constant_identifier_names
  String? client_secret;
  // ignore: non_constant_identifier_names
  String? grant_type ;
  // ignore: non_constant_identifier_names
  String? refresh_token;
  // ignore: non_constant_identifier_names
  GetRefreshTokenVM.setProperty({this.client_id,this.client_secret,this.refresh_token,this.grant_type});
  @override
  GetRefreshTokenVM.fromJson(Map<String, dynamic> json):client_id = json['client_id'],client_secret = json['client_secret'],refresh_token = json['refresh_token'],grant_type = json['grant_type'];
  Map<String, dynamic> toJson() =>{'client_id' : client_id,'client_secret' : client_secret,'refresh_token' : refresh_token,'grant_type' : grant_type};
}
