import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';




class EmailField extends StatefulWidget {
  final TextEditingController emailController;

   const EmailField({
    super.key,
    required this.emailController,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email Address', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
        SizedBox(height: 8,),
        TextFormField(
          controller: widget.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email,
            ),
          ),
          validator: (value)
          {
            if(value!.isNotEmpty) {
              return EmailValidator.validate(value) ?  null : 'Email must be correct';
            } else
            {
              return 'Email Can\'t be Empty';
            }
          },
        )
      ],
    );
  }
}
