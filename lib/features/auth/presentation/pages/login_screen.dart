import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taqs/config/extentions/extention.dart';
import 'package:taqs/config/style/text_styles.dart';
import 'package:taqs/features/auth/presentation/manager/login_cubit/cubit.dart';
import 'package:taqs/features/auth/presentation/manager/login_cubit/state.dart';
import 'package:taqs/features/auth/presentation/pages/register_screen.dart';
import 'package:taqs/features/auth/presentation/widgets/button/button.dart';
import '../../../../db_injection.dart';
import '../../../home/home_screen.dart';
import '../widgets/fields/email.dart';
import '../widgets/fields/password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context)=>LoginCubit(sl()),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }
            if(state is SignInError)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                    content: Text(state.error,style:AppTextStyle.font16white700,))
              );
            }
          },
          builder: (context, state) {
            var loginCubit = LoginCubit.get(context);
            return SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.h, top: 140.h),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: loginCubit.formKey,
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: AppTextStyle.font24black700
                    ),
                    8.hs,
                    Text(
                      'We Missed You',
                      style: AppTextStyle.font24black700,
                    ),
                    32.hs,
                    EmailField(emailController: loginCubit.emailController),
                    16.hs,
                    PasswordField(
                        passwordController: loginCubit.passwordController),
                    32.hs,
                    state is SignInLoading
                        ? Center(child: CircularProgressIndicator())
                        : DefaultButton(
                            onPressed: () {
                              if (loginCubit.formKey.currentState!.validate()) {
                                loginCubit.signIn(loginCubit.emailController.text,
                                    loginCubit.passwordController.text);
                              }
                            },
                            title: 'Login'),
                    24.hs,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account',
                            style: AppTextStyle.font16black700),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text('Create account',
                                style: AppTextStyle.font16blue700)),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
