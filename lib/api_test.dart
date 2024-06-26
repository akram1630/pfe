import 'package:dio/dio.dart';
import 'package:pfe/models/categories_model.dart';
import 'package:pfe/models/relatedObjectsModel.dart';
import 'package:pfe/models/userModel.dart';
import 'package:pfe/shared/constants.dart';
import 'package:pfe/shared/dio_helper.dart';

import 'models/allServicesModel.dart';
import 'models/tokenModel.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class testApi{

  static Dio ? dio ;
  static init(){
    dio = Dio(
        BaseOptions(
          baseUrl: "https://mypfe.cntic-club.com/",
            //baseUrl: 'https://api.escuelajs.co/',
          //baseUrl: 'https://gentle-driving-mastodon.ngrok-free.app/',
          receiveDataWhenStatusError: true,
            headers: {
              'Content-Type' : 'application/json',
            }
        )
    );
  }


  static Future<Response> post({ // future cuz the func includ .get() func
    required String url,
    required Map<String, dynamic>  data, // the original
    Map<String, dynamic> ? query,
    String lang = 'en',
    String  ? token
  }) async
  {
    // we use headers here to do override when calling func
    dio!.options.headers = { // no overriding .headers == .add
      //'lang' : lang,
      'Content-Type' : 'application/json',
      "Authorization": token
    };
    return  dio!.post(
        url ,
        queryParameters: query ,
        data: data // the original
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
      'Authorization' : token ?? '', // "If token is null, use an empty string ''
      'Content-Type' : 'application/json',
    };
    return  await dio!.get(url , queryParameters: query);
  }
}



void main() {

  dioHelper.init();
  void getReletedObj(){
    dioHelper.getData(
        url: 'Api/Related_objects/',
        token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzIyNjgwMzMyLCJpYXQiOjE3MTQ5MDQzMzIsImp0aSI6IjQyMDUzYzFjZGVkNjQyZDE4N2JkMzljYTUyZjFhNDllIiwidXNlcl9pZCI6MTF9.3Z3hMunymlMsWaA-Zm5_6LeMdX1gitym__bQufkoPLo'
    ).then((value){
      print('relatedObj--------------${value.data}');
      objects = relatedObjectsModel.fromJson(value.data);
      print(objects);
    })
        .catchError((err){
      print('relatedObj--------------${err.toString()}');

    });
  }
  getReletedObj();
/*
  dioHelper.delete(
    data: {},
      url: 'Api/Delete_Date/33/', //id of date
      token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4NTU3NTg0LCJpYXQiOjE3MTA3ODE1ODQsImp0aSI6IjViNTJkOWIyNDAxNzQyYzhhMDcyYTEwNmJjNDg2YzdjIiwidXNlcl9pZCI6Mzh9.U-TtsAZfme9P269eolFw4DCT4DCikmM2aDzY4_kYR5g'
  ).then((value){

    print(value.data);

  })
      .catchError((err){

    print(err.toString());
  });
*/
/*
  dioHelper.getData(url: 'Api/All_Services/' )
      .then((value){
    print(value.data);
  })
      .catchError((err){
    print(err.toString());
  });
*/
/*
  dioHelper.getData(
      url: 'Api/Related_objects/',
      token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzIyMTAzNDY1LCJpYXQiOjE3MTQzMjc0NjUsImp0aSI6ImMzM2QwNWQxNWIwNDRiYjZiYWYxZTkwMTZiZmRmNDg2IiwidXNlcl9pZCI6MTF9.MhuqVmxcMw6DZMq4iQJ0hbrwsmzNPeEv4AcDcjvkYRY'
  ).then((value){
    print(value.data);
    relatedObjectsModel ? obj = relatedObjectsModel.fromJson(value.data);
    obj.printAll();
     })
      .catchError((err){
    print(err.toString());
  });
*/
  ///
  ///
/*
  dioHelper.patchData(
    data: {
      "first_name": "theNewName",
      "last_name": "theNewLast",
      "phone_number": "0025978754",
      "email": "theNew@gmail.com",
    },
    url: 'auth/Update_Client/',
    token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4NTU3NTg0LCJpYXQiOjE3MTA3ODE1ODQsImp0aSI6IjViNTJkOWIyNDAxNzQyYzhhMDcyYTEwNmJjNDg2YzdjIiwidXNlcl9pZCI6Mzh9.U-TtsAZfme9P269eolFw4DCT4DCikmM2aDzY4_kYR5g',
  ).then((value){
    print(value.data);
  }).catchError((err){
    print(err.toString());
  });
*/
/*
 //user data
  dioHelper.getData(
      url: 'auth/Client_Profile/',
      token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzIyMTAzNDY1LCJpYXQiOjE3MTQzMjc0NjUsImp0aSI6ImMzM2QwNWQxNWIwNDRiYjZiYWYxZTkwMTZiZmRmNDg2IiwidXNlcl9pZCI6MTF9.MhuqVmxcMw6DZMq4iQJ0hbrwsmzNPeEv4AcDcjvkYRY',
  ).then((value){

    userModel ? user = userModel.fromJson(value.data);
    print(value.data); // pic = domain/key profile
    //print(user.first_name);

  }).catchError((err){
    print(err.toString());
  });
*/
/*
//take a date
dioHelper.postData(
    url: 'Api/RegisterDate/',
    data: {
      "serv_id" : "yalidine"
    },
    token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzIyMTAzNDY1LCJpYXQiOjE3MTQzMjc0NjUsImp0aSI6ImMzM2QwNWQxNWIwNDRiYjZiYWYxZTkwMTZiZmRmNDg2IiwidXNlcl9pZCI6MTF9.MhuqVmxcMw6DZMq4iQJ0hbrwsmzNPeEv4AcDcjvkYRY'
).then((value){

    print(value.statusCode);
    print(value.data);
}).catchError((err){
  print(err.toString());
});
*/
/*
 //register user
  dioHelper.postData(
      url: 'auth/Client_Register/',
      data: {
        "first_name" : "akram",
        "last_name" : "bou",
        "email" : "akram@gmail.com",
        "phone_number":"0548754594",
        "password" : "123456"
      }
  ).then((value){
    print('000');
    print(value.data);
    print('111');
    bool status = value.statusCode ==201 ? true : false ;
    print('222');
    print(value.statusCode);
    print('333');

  }).catchError((err){

    print(err.toString());
  });
*/
 //login
//   dioHelper.postData(
//     url: 'auth/token/',
//     data:{
//       "username" : 'akram@gmail.com',
//       "password" : '23456',
//     }
// ).then((value){
//   tokenModel ? tok = tokenModel.fromJson(json: value.data);
//   print(tok.status);
//   print(tok.Code);
//   print(tok.user!.first_name);
//   print(tok.access);
// }).catchError((err){
//   print('error login : $err');
// });

//last token :
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzIyMTAzNDY1LCJpYXQiOjE3MTQzMjc0NjUsImp0aSI6ImMzM2QwNWQxNWIwNDRiYjZiYWYxZTkwMTZiZmRmNDg2IiwidXNlcl9pZCI6MTF9.MhuqVmxcMw6DZMq4iQJ0hbrwsmzNPeEv4AcDcjvkYRY

}




/* //bearer example
testApi.post(url: 'api/v1/auth/login', data:{
   "email": "john@mail.com",
   "password": "changeme"
 } ).then((value){
   print(value.data['access_token']);
 });


 String ? myToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTcxMDY5Mjc5NSwiZXhwIjoxNzEyNDIwNzk1fQ.PcejolxFIterlD1QJeoH4DddJ3Et7LZ6s-iYAQjd7mc' ;

  testApi.getData(
   url: 'api/v1/auth/profile',
   token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTcxMDY5Mjc5NSwiZXhwIjoxNzEyNDIwNzk1fQ.PcejolxFIterlD1QJeoH4DddJ3Et7LZ6s-iYAQjd7mc',

  ).then((value){
   print(value.data);
 }).catchError((err)=>print(err.toString()));
*/
/////////////////////////////////////////////////////////////
/*
   //all categories
testApi.getData(url: 'Api/All_Categories/',).then((value){
    print(value.data);
});
  */
////////////////////////////////////////////////////////////
/*
//take a date
dioHelper.postData(
    url: 'Api/RegisterDate/',
    data: {
      "serv_id" : "One Drive"
    },
  token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4NDk2MDYzLCJpYXQiOjE3MTA3MjAwNjMsImp0aSI6IjZiZWVmNTEzODgwMzRhNTJhMTMwY2YyZWMxNDlkYTFjIiwidXNlcl9pZCI6MzV9.tEBwlrYGZHAM4_u_akFFGIBtF3kIJVKlOXlXYKMwpgw'
).then((value){

    print(value.statusCode);
    print(value.data);
}).catchError((err){
  print(err.toString());
});
*/
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
