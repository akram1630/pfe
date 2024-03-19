
import '../../../models/tokenModel.dart';

abstract class loginStates{}

class loginInitialStates extends loginStates{}

class loginLoadingStates extends loginStates{}

class loginSuccessStates extends loginStates{
  final tokenModel login;
  loginSuccessStates(this.login);
}

class loginErrorStates extends loginStates{
  final tokenModel login;
  loginErrorStates(this.login);
}

class loginChangePassVisibilityStates extends loginStates{}