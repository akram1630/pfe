import 'package:dio/dio.dart';
import 'package:pfe/shared/dio_helper.dart';

import 'models/tokenModel.dart';

class testApi{

  static Dio ? dio ;
  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://reasonably-thorough-monitor.ngrok-free.app/',
            receiveDataWhenStatusError: true,
            // headers used cuz of postman
            headers: {
              'Content-Type' : 'application/json',
              //'lang' : 'en'
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
      //'lang' : lang,
      'Content-Type' : 'application/json',
     // 'Authorization' : token  ,
    };
    return  dio!.post(
        url ,
        queryParameters: query ,
        data: data // the original
    );
  }
}



void main(){

  testApi.init();

  /*
  testApi.post(
      url: 'auth/Client_Register/',
      data: {
        "first_name" : "akram",
        "last_name" : "boutoutaou",
        "email" : "akram12@gmail.com",
        "password" : "fpef44sd"
      }
  ).then((value){
    print(value.statusMessage);
    print(value.statusCode);
    print(value.data);

  }).catchError((err){
    print(err.toString());
  });
  */
  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// 
/*
  testApi.post(
      url: 'auth/token/',
      data: {
        "username" : "akram@gmail.com",
        "password" : "akram123456",
      }
  ).then((value){
    tokenModel ? user ;
    user = tokenModel.fromJson(json: value.data);
    print(user.token);
    print(user.status);
    print(user.user!.username);
    print(user.user!.email);
    print(user.user!.id);


  })
      .catchError((err){
    print(err.toString());
  });
  */
  /*
  testApi.get(url: 'Api/All_Categories' )
      .then((value){
        print(value.data);
      })
      .catchError((err){
        print(err.toString());
      });
  */
  /*
  testApi.get(url: 'Api/All_Services/' )
      .then((value){
    print(value.data);
  })
      .catchError((err){
    print(err.toString());
  });

   */
  dioHelper.init();
  dioHelper.getData(url: 'Api/All_Services/' )
      .then((value){
    print(value.data);
  })
      .catchError((err){
    print(err.toString());
  });
  dioHelper.postData(
      url: 'Api/RegisterDate',
      data:{
        "serv_id" : "Clinique"
      }
  ).then((value) {
    print(value.data);
  }).catchError((err){
    print('my err is $err');
  });

}
