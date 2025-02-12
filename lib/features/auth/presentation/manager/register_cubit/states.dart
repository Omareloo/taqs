import 'package:taqs/features/auth/data/models/user_model.dart';

abstract class RegisterStates{}

class RegisterInitial extends RegisterStates{}

class RegisterLoading extends RegisterStates{}

class RegisterSuccess extends RegisterStates{
  final String user;

  RegisterSuccess(this.user);
}

class RegisterError extends RegisterStates{
  final String error;

  RegisterError(this.error);
}

class SavedUser extends RegisterStates{
  final UserModel userModel;

  SavedUser(this.userModel);
}

