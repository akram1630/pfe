import 'package:pfe/models/loginModel.dart';

abstract class loginStates{}

class loginInitialStates extends loginStates{}

class loginLoadingStates extends loginStates{}

class loginSuccessStates extends loginStates{
  final loginModel loginMod;
  loginSuccessStates(this.loginMod);
}

class loginErrorStates extends loginStates{
  final loginModel loginMod;
  loginErrorStates(this.loginMod);
}

class loginChangePassVisibilityStates extends loginStates{}