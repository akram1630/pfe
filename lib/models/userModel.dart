class userModel{

  int ? id ;
  String ? first_name ;
  String ? last_name ;
  String ?  email ;
  String ? phone_number ;
  String ? Profile_pic ;
  //named constructor
  userModel.fromJson(Map<String , dynamic> json){
    id = json['id'] ;
    first_name = json['first_name'] ;
    email = json['email'] ;
    last_name = json['last_name'] ;
    phone_number = json['phone_number'] ;
    Profile_pic = json['Profile_pic'] ;

  }

}