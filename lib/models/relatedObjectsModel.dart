class relatedObjectsModel {

  List<dataObjects> data=[] ;
   relatedObjectsModel.fromJson(Map<String,dynamic> json){
     if(json['data'] is String == false)
     json['data'].forEach((element){
       data.add(dataObjects.fromJson(element));
     });
   }

   void printAll(){
     data.forEach((element) {
       print(element.id);
       print(element.client);
       print(element.service);
       print(element.place);
       print(element.clients_before);
       print('-------------------------');
     });
   }
}
class dataObjects{
  int ? id;
  int ? client;
  String ? service;
  int ? place;
  int ? clients_before;
  dataObjects.fromJson(Map<String,dynamic> json){
    id = json['id'];
    client = json['client'];
    service = json['service'];
    place = json['place'];
    clients_before = json['clients_before'];
  }
}