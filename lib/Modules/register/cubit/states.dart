
import 'package:graduation_project/Models/login_Model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates
{
  final LoginModel loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates
{
  final String error;

  RegisterErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}


class CheckboxToggleState1 extends RegisterStates{}

class CheckboxToggleState2 extends RegisterStates{}

class CheckboxToggleState3 extends RegisterStates{}

class CheckboxGenderToggleState extends RegisterStates{}