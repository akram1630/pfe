import 'package:dio/dio.dart';

import 'constants.dart';

class dioHelper{

  static Dio ? dio;

  // it should be called in main() only one time:
  static init(){
    dio = Dio(
      BaseOptions(
        //baseUrl: 'https://gentle-driving-mastodon.ngrok-free.app/',
          baseUrl: 'https://mypfe.cntic-club.com/',
          receiveDataWhenStatusError: true,
          // headers used cuz of postman
          headers: {
            'Content-Type' : 'application/json',
            //'Authorization' :   ,
            //'lang' : 'en'
          }
      )
    );
  }


  static Future<Response>  getData({ // future cuz the func includ .get() func
    required String url, //sub url
    Map<String, dynamic> ? query ,
    String lang = 'ar',
    String ? token
  }) async
  {
    // we use headers here to do override when calling func
    dio!.options.headers = {  //override : dio.opt = Dio( base option : is done only when init but now like we add
      //'lang' : lang,
      'Authorization' : token , // "If token is null, use an empty string ''
      'Content-Type' : 'application/json',
    };
    return  await dio!.get(url , queryParameters: query);
  }



  static Future<Response> postData({ // future cuz the func includ .get() func
    required String url,
    required Map<String, dynamic> data, // the original
    Map<String, dynamic> ? query,
    String lang = 'en',
    String  ? token
  }) async
  {

    // we use headers here to do override when calling func
    dio!.options.headers = { // no overriding .headers == .add
      //'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token  ,
    };
    return  dio!.post(
        url ,
        queryParameters: query ,
        data: data // the original
    );
  }

  static Future<Response> delete({ // future cuz the func includ .get() func
    required String url,
    required Map<String, dynamic> data, // the original
    Map<String, dynamic> ? query,
    String lang = 'en',
    String  ? token
  }) async
  {

    // we use headers here to do override when calling func
    dio!.options.headers = { // no overriding .headers == .add
      //'lang' : lang,
      'Content-Type' : 'application/json',
      'Authorization' : token  ,
    };
    return  dio!.delete(
        url ,
        queryParameters: query ,
        data: data // the original
    );
  }

  static Future<Response> putData({ // future cuz the func includ .get() func
    required String url,
    required Map<String, dynamic> data, // like update
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
    return  dio!.patch(
        url ,
        queryParameters: query ,
        data: data
    );
  }
}