import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'package:pfe/models/tokenModel.dart';
import 'package:pfe/shared/dio_helper.dart';

import 'loginStates.dart';


class loginCubit extends Cubit<loginStates> {
  loginCubit() : super(loginInitialStates());

  static loginCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

 tokenModel ? loginToken ;
  void pfeLoginUser({
    required String email ,
    required String password ,
  })
  {
    print('login-start--------------');
    emit(loginLoadingStates());
    dioHelper.postData(
        url: 'auth/token/',
        data:{
          "username" : email,
          "password" : password,
        }
    ).then((value){
      loginToken = tokenModel.fromJson(json: value.data);

      emit(loginSuccessStates(loginToken!));
    }).catchError((err){
      emit(loginErrorStates(err.toString()));
      print('error login : $err');

    });
  }


  IconData suffixEyePass = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassVisibility() {
    isPassword = !isPassword;
    suffixEyePass =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(loginChangePassVisibilityStates());
  }
}
