
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/auth/presentation/manager/login_cubit/cubit.dart';
import 'package:taqs/features/auth/presentation/pages/register_screen.dart';
import 'package:taqs/features/auth/presentation/widgets/button/button.dart';
import '../../../../db_injection.dart';
import '../../../home/home_screen.dart';
import '../widgets/fields/email.dart';
import '../widgets/fields/password.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    var loginCubit = LoginCubit.get(context);

    return  BlocProvider(
      create:    (context) => LoginCubit(sl()),
      child: BlocBuilder(
        builder: (context, state) {
          return  SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(start: 16, end: 16, top: 140),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: loginCubit.formKey,
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),              ),
                  SizedBox(height: 8,),
                  Text(
                    'We Missed You',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32,),
                  EmailField(emailController: loginCubit.emailController),
                  SizedBox(
                    height: 16,
                  ),
                  PasswordField(passwordController: loginCubit.passwordController),
                  SizedBox(
                    height: 32,
                  ),
                  DefaultButton(onPressed: ()
                  {
                    if(loginCubit.formKey.currentState!.validate())
                    {
                      loginCubit.signIn(loginCubit.emailController.text, loginCubit.passwordController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));                      }
                  }, title: 'Login'),
                  SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                        'Forgotten Password?',style: TextStyle
                      (
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Don\'t have an account',style: TextStyle
                        (
                        color: Colors.black,
                        fontSize: 16,
                      )
                      ),
                      TextButton(
                          onPressed: ()
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                              'Create account',style: TextStyle
                            (
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          )
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
