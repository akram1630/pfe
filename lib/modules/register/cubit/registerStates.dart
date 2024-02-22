import 'package:pfe/models/loginModel.dart';

abstract class registerStates {}

class registerInitialStates extends registerStates {}

class registerLoadingStates extends registerStates {}

class registerSeccessStates extends registerStates {
  final loginModel  loginMod;
  registerSeccessStates(this.loginMod);
}

class registerErrorStates extends registerStates {
  final String  error;
  registerErrorStates(this.error);
}

class registerChangePasswordVisibiltyStates extends registerStates{}
