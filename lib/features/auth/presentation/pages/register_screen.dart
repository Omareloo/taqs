import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taqs/config/style/text_styles.dart';
import 'package:taqs/features/auth/presentation/manager/register_cubit/cubit.dart';
import 'package:taqs/features/home/home_screen.dart';

import '../../../../db_injection.dart';
import '../manager/register_cubit/states.dart';
import '../widgets/button/button.dart';
import '../widgets/fields/ageField.dart';
import '../widgets/fields/email.dart';
import '../widgets/fields/nameField.dart';
import '../widgets/fields/password.dart';
import '../widgets/fields/phoneField.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(sl()),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        }, builder: (context, state) {
          var registerCubit = RegisterCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.h, top: 16.h),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: registerCubit.formKey,
                child: Column(
                  children: [
                    Text('Register',
                        style: AppTextStyle.font24black700),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text('Browse with world!',
                        style: AppTextStyle.font24black700),
                    SizedBox(
                      height: 24.h,
                    ),
                    NameField(nameController: registerCubit.nameController),
                    SizedBox(
                      height: 8.h,
                    ),
                    EmailField(emailController: registerCubit.emailController),
                    SizedBox(
                      height: 8.h,
                    ),
                    PasswordField(
                        passwordController: registerCubit.passwordController),
                    SizedBox(
                      height: 8.h,
                    ),
                    PhoneField(phoneController: registerCubit.phoneController),
                    SizedBox(
                      height: 8.h,
                    ),
                    AgeField(ageController: registerCubit.ageController),
                    SizedBox(
                      height: 16.h,
                    ),
                    state is RegisterLoading
                        ? Center(child: CircularProgressIndicator())
                        : DefaultButton(
                        onPressed: () {
                          if (registerCubit.formKey.currentState!.validate()) {
                            registerCubit.signUp(
                                registerCubit.emailController.text,
                                registerCubit.passwordController.text,
                                registerCubit.nameController.text,
                                registerCubit.phoneController.text,
                                registerCubit.ageController.text
                            );
                                }
                        },
                        title: 'Register',),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
