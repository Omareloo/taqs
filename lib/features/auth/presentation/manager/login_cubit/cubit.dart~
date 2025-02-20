// login_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/auth/presentation/manager/login_cubit/state.dart';
import '../../../data/repository/auth_repository.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(InitState());

  static LoginCubit get(BuildContext context) => context.read<LoginCubit>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void signIn(String email, String password) async {
    emit(SignInLoading());
    try {
      final user = await _authRepository.signInWithEmailAndPassword(email, password);
      if (user != null) {
        emit(SignInSuccess(user));
      } else {
        emit(SignInError('Sign in failed'));
      }
    } catch (e) {
      emit(SignInError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}