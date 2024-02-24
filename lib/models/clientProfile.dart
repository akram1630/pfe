class clientProfile{
  userData ? user ;
  String ? Profile_pic ;

  clientProfile.fromJson({Map<String,dynamic> ? json}){
    Profile_pic = json!['Profile_pic'];
    user = userData.fromJson(json: json['user']);
  }
}
class userData{
  String ? first_name ;
  String ? last_name ;
  String ? email ;
  userData.fromJson({Map<String,dynamic> ? json}){
    first_name = json!['first_name'];
    last_name = json['last_name'];
    email = json['email'];
  }
}