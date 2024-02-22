class categoriesModel{
  List<dataCat> data = [] ;

  categoriesModel.fromJson({Map<String,dynamic> ? json}){
    data.forEach((element) {
      data.add(
          dataCat.fromJson(json: json!['data'])
      );
    });
  }
}
class dataCat{
  int ? id ;
  String ? category;

  dataCat.fromJson({Map<String,dynamic> ? json}){
    id = json!['id'];
    category = json['category'];
  }
}