import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:pfe/models/loginModel.dart';
import 'package:pfe/shared/dio_helper.dart';

import '../../../shared/end_points.dart';
import 'loginStates.dart';


class loginCubit extends Cubit<loginStates> {
  loginCubit() : super(loginInitialStates());

  static loginCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  loginModel? loginMod;

  void loginUser({
    required String email ,
    required String password ,
  }){
    print('000000000000000');
    emit(loginLoadingStates()); // will be caugh in listener
    print('111111111111111');
    dioHelper.postData(
        url: LOGIN,
        data: {
          'email' : email ,
          'password' : password
        }
    ).then((value){
      print('222222222222222');
      //if (value.data != null) {
        print('3333333333333');
        loginMod = loginModel.fromJson(value.data!);
        print('444444444444444444');
        print(loginMod!.message);
        print(loginMod!.status);
        print('5555555555555555555');
        emit(loginSuccessStates(loginMod!));
      //}

    }).catchError((err){
      print('error login : $err');
      emit(loginErrorStates(loginMod!));
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
