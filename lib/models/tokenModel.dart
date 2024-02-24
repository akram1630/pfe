import 'dart:convert';

class tokenModel{
  String ? token ;
  bool ? status ;
  userData ? user ;
  tokenModel.fromJson({Map<String , dynamic>  ? json}){
    status = json!['status'];
    token =  json['token'];
    user = userData.fromJson( json: json['user']);
  }

}
class userData{
  int ? id ;
  String ? username ;
  String ? email ;
  userData.fromJson({Map<String , dynamic>  ? json}){
    id = json!['id'] ;
    username = json['username'] ;
    email = json['email'] ;
  }
}