import 'package:pfe/models/userModel.dart';

class pfeLoginModel{
  String ? access ;
  bool ? status ;
  userData ? user ;
  pfeLoginModel.fromJson(Map<String , dynamic>  json ){
    access = json['access'];
    status = json['status'];
    //user = userData.fromJson(json: json[''])

  }
}

class userData{
  int ? id ;
  String ? username;
  String ? email ;
  userData.fromJson(Map<String,dynamic> json){
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }
}