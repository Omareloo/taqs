// register_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/auth/presentation/manager/register_cubit/states.dart';
import '../../../data/repository/auth_repository.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterInitial());

  static RegisterCubit get(BuildContext context) => context.read<RegisterCubit>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void signUp(String email, String password, String name, String phone, String age) async {
    emit(RegisterLoading());
    try {
      final user = await _authRepository.signUpWithEmailAndPasswordAndInfo(
          email: email, password: password, name: name, phone: phone, age: int.parse(age));
      if (user != null) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError('Sign up failed'));
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    ageController.dispose();
    return super.close();
  }
}