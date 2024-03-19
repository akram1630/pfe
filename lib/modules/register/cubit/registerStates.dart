
import '../../../models/tokenModel.dart';

abstract class registerStates {}

class registerInitialStates extends registerStates {}

class registerLoadingStates extends registerStates {}

class registerSeccessStates extends registerStates {
  final bool status;
  registerSeccessStates(this.status);
}

class registerErrorStates extends registerStates {
  final String  error;
  registerErrorStates(this.error);
}

class registerChangePasswordVisibiltyStates extends registerStates{}
