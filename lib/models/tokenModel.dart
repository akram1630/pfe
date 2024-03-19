import 'dart:convert';

class tokenModel{
  String ? reresh ;
  String ? access ;
  bool ? status ;
  int ? Code ;
  userData ? user ;
  tokenModel.fromJson({Map<String , dynamic>  ? json}){
    status = json!['status'];
    Code = json['Code'];
    access = json['access'];
    reresh = json['reresh'];
    user = userData.fromJson( json: json['user']);
  }

}

class userData{
  int ? id ;
  String ? token ;
  String ? last_name ;
  String ? first_name ;
  String ? username ;
  String ? email ;
  userData.fromJson({Map<String , dynamic>  ? json}){
    id = json!['id'] ;
    last_name = json['last_name'] ;
    first_name = json['first_name'] ;
    username = json['username'] ;
    email = json['email'] ;
  }

}