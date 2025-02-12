abstract class LoginStates{}

class InitState extends LoginStates{}

class SignInLoading extends LoginStates{}

class SignInSuccess extends LoginStates{
  final String user;

  SignInSuccess(this.user);
}

class SignInError extends LoginStates{
  final String error;

  SignInError(this.error);
}

