class categoriesModel{
  List<dataCat> data = [] ;

  categoriesModel.fromJson({Map<String,dynamic> ? json}){
    if(json!['data'] != null )
    data.forEach((element) {
      data.add(
          dataCat.fromJson(json: json['data'])
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

  @override
  String toString() {
    print('lazm hadi cuz print can\'t printing the objects');
    return 'id: $id, category: $category ';
  }

}