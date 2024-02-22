import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/models/loginModel.dart';
import 'package:pfe/modules/register/cubit/registerStates.dart';
import 'package:pfe/shared/dio_helper.dart';

import '../../../shared/end_points.dart';


class registerCubit extends Cubit<registerStates>{

  registerCubit() : super(registerInitialStates());

  static registerCubit get(BuildContext context){
    return BlocProvider.of(context);
  }

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

  IconData suffixEyePass = Icons.visibility_outlined ;
  bool isPassword = true;
  void changePassVisibility(){
    isPassword  = !isPassword;
    suffixEyePass = isPassword ?  Icons.visibility_off_outlined : Icons.visibility_outlined ;
    emit(registerChangePasswordVisibiltyStates());
  }

}