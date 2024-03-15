class allServices {
  List<service> services = [];

  allServices.fromJson(Map<String, dynamic> json) {
    //json['Data'] = null ; length will be 0
    if(json['Data'] != null)
    json['Data'].forEach((element){
      services.add(service.fromJson(element));
    });
  }
}

class service {
  int ? id;
  String ? Service_name;
  int ? category;
  int ? Qte;

  service.fromJson(Map<String, dynamic> json) {
      id= json['id'];
      Service_name = json['Service_name'];
      category= json['category'];
      Qte= json['Qte'];
  }
  @override
  String toString() {
    print('lazm hadi cuz print can\'t printing the objects');
    return 'id: $id, Service_name: $Service_name, category: $category, Qte: $Qte';
  }
}

