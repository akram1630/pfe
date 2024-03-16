/*import 'package:pfe/models/userModel.dart';

class loginModel{
  bool ? status ;
  String ? message ;
  userModel ? data ;

  loginModel.fromJson( Map<String , dynamic> json ){
    status = json['status'] ;
    message = json['message'] ;
    /////////////////////////////////// cuz (data : null) if email and pass are false
    //data = json['data'] != null ? userModel.fromJson(json['data']) : null ;
    data = userModel.fromJson(json['data'])  ;
  }
}

*/