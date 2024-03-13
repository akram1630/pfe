import 'dart:convert';

class tokenModel{
  bool ? status ;
  userData ? user ;
  tokenModel.fromJson({Map<String , dynamic>  ? json}){
    status = json!['status'];
    user = userData.fromJson( json: json['user']);
  }

}
class userData{
  int ? id ;
  String ? token ;
  String ? username ;
  String ? email ;
  userData.fromJson({Map<String , dynamic>  ? json}){
    id = json!['id'] ;
    token =  json['token'];
    username = json['username'] ;
    email = json['email'] ;

  }
}