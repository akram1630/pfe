class userModel{

  int ? id ;
  String ? name ;
  String ?  email ;
  String ? phone ;
  String ? image ;
  int ? points ;
  int ? credit ;
  String ? token ;
  //named constructor
  userModel.fromJson(Map<String , dynamic> json){
    id = json['id'] ;
    name = json['name'] ;
    email = json['email'] ;
    phone = json['phone'] ;
    image = json['image'] ;
    points = json['points'] ;
    credit = json['credit'] ;
    token = json['token'] ;
  }

}