class categoriesModel{
  List<dataCat> data = [] ;

  categoriesModel.fromJson({Map<String,dynamic> ? json}){
    data.forEach((element) {
      data.add(dataCat.fromJson(
        id: json!['id'] ,
        category:  json['category']
      ));
    });
  }
}
class dataCat{
  int ? id ;
  String ? category;
  dataCat.fromJson({this.id , this.category});
}