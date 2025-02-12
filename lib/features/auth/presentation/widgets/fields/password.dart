import 'package:flutter/material.dart';
import 'package:password_validator_package/password_validator_package.dart';


class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;


   const PasswordField({super.key,required this.passwordController,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password',style : TextStyle(fontSize: 16,
          fontWeight: FontWeight.bold,),),
        SizedBox(height: 8,),
        TextFormField(
          controller: widget.passwordController,
          obscureText: _isPassword,
          keyboardType: TextInputType.visiblePassword ,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon:  IconButton(
                icon: Icon(
                    _isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined
                 ),
                onPressed: ()
                {
                 setState(() {
                 _isPassword = !_isPassword;
                 });
                },
              )),
          validator: (value)
          {
            if(value!.isNotEmpty) {
              return PasswordValidator.validatePassword(value) ?  null : 'Password must be correct';
            } else
            {
              return 'Password Can\'t be Empty';
            }
          },
        ),
      ],
    );
  }
}
