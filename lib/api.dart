import 'package:dio/dio.dart';

class dioHelper01{
  static Dio ? dio ;

  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: 'http://127.0.0.1:8000/auth/',
            receiveDataWhenStatusError: true,
            // headers used cuz of postman
            headers: {
              'Content-Type' : 'application/json',
              'lang' : 'en'
            }
        )
    );
  }

  static Future<Response>  get({ // future cuz the func includ .get() func
    required String url, //sub url
    Map<String, dynamic> ? query ,
    String lang = 'ar',
    String ? token
  }) async
  {
    // we use headers here to do override when calling func
    dio!.options.headers = {  //override : dio.opt = Dio( base option : is done only when init but now like we add
      'lang' : lang,
      'Authorization' : token ?? '', // "If token is null, use an empty string ''
      'Content-Type' : 'application/json',
    };
    return  await dio!.get(url , queryParameters: query);
  }

  static Future<Response> post({ // future cuz the func includ .get() func
    required String url,
    required Map<String, dynamic> data, // the original
    Map<String, dynamic> ? query,
    String lang = 'en',
    String  ? token
  }) async
  {
    // we use headers here to do override when calling func
    dio!.options.headers = { // no overriding .headers == .add
      'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token  ,
    };
    return  dio!.post(
        url ,
        queryParameters: query ,
        data: data // the original
    );
  }
}
void main(){

  dioHelper01.init();
  dioHelper01.post(
      url: 'token',
      data: {
        "username" : "ilyes@gmail.com",
        "password" : "ilyes123123"
      }
  ).then((value){
    print(value.data);
  }).catchError((err){
    print(err.toString());
  });

}