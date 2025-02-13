import 'package:taqs/features/auth/domain/entities/auth_user.dart';

abstract class LoginStates{}

class InitState extends LoginStates{}

class SignInLoading extends LoginStates{}

class SignInSuccess extends LoginStates{
  AuthUser user;

  SignInSuccess(this.user);
}

class SignInError extends LoginStates{
  final String error;

  SignInError(this.error);
}

