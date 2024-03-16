import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/api_test.dart';
import 'package:pfe/models/loginModel.dart';
import 'package:pfe/modules/register/cubit/registerStates.dart';
import 'package:pfe/shared/dio_helper.dart';

import '../../../models/tokenModel.dart';
import '../../../shared/end_points.dart';


class registerCubit extends Cubit<registerStates>{

  registerCubit() : super(registerInitialStates());

  static registerCubit get(BuildContext context){
    return BlocProvider.of(context);
  }

 // tokenModel ? tokenRegister ;
  void pfeUserRegister({
    required String email ,
    required String password ,
    required String first_name ,
    required String last_name ,
  })
  {
    emit(registerLoadingStates());
    print('--11');
    dioHelper.postData(
        url: 'auth/Client_Register/',
        data: {
          "first_name" : first_name,
          "last_name" : last_name,
          "email" : email,
          "password" : password
        }
    ).then((value){
      print('000');
      print(value.data);
      print('111');
      bool status = value.statusCode ==201 ? true : false ;
      print('222');
      print(value.statusCode);
      print('333');
      emit(registerSeccessStates(status));
    }).catchError((err){
      emit(registerErrorStates(err.toString()));
      print(err.toString());
    });
  }
  /*
  loginModel ? loginMod ;
  void userRegister({
    required String email ,
    required String password ,
    required String name ,
    required String phone ,
  }){
    emit(registerLoadingStates()); // to scroll for 2 second with consitionalBuilder
    dioHelper.postData(
        url: REGISTER,
        data: {
          'email' : email ,
          'name' : name ,
          'phone' : phone ,
          'password' : password
        }
    ).then((value){
      loginMod = loginModel.fromJson(value.data);
      print(loginMod!.status);
      print(loginMod!.message);
      emit(registerSeccessStates(loginMod!));
    }).catchError((err){
      print('error is $err');
      emit(registerErrorStates(err));
    });
  }
  */
  IconData suffixEyePass = Icons.visibility_outlined ;
  bool isPassword = true;
  void changePassVisibility(){
    isPassword  = !isPassword;
    suffixEyePass = isPassword ?  Icons.visibility_off_outlined : Icons.visibility_outlined ;
    emit(registerChangePasswordVisibiltyStates());
  }

}