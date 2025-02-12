import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/auth/data/models/user_model.dart';
import 'package:taqs/features/auth/presentation/manager/register_cubit/states.dart';

import '../../../data/repository/auth_repository.dart';

class RegisterCubit extends Cubit<RegisterStates> {

  final AuthRepository _authRepository;


  RegisterCubit(this._authRepository) : super(RegisterInitial());

  static RegisterCubit get(BuildContext context)=>context.read<RegisterCubit>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  void signUp(String email, String password, String name, String phone, String age) async {
    emit(RegisterLoading());
    final user = await _authRepository.createUserWithEmailAndPassword(email, password);
    if(user != null) {
      emit(RegisterSuccess(user as String));
      sendUser(UserModel(email: email, uId: user.uId, name: name, phone: phone, age: age));
    }
   else {
      emit(RegisterError('Sign up failed'));
    }
  }
  void sendUser(UserModel userModel) async {
    await _authRepository.saveUser(userModel);
  }


  
  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    ageController.dispose();
    // TODO: implement close
    return super.close();
  }

}



