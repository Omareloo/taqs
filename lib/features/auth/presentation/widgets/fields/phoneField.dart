import 'package:flutter/material.dart';




class PhoneField extends StatefulWidget {
  final TextEditingController phoneController;




  const PhoneField({
    super.key,
    required this.phoneController,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.phoneController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Phone',
            prefixIcon: Icon(
              Icons.numbers,
            ),
          ),
          validator: (value)
          {
            if(value!.isEmpty) {
              return 'Phone Can\'t be Empty';
            }
            return null;
          },
        )
      ],
    );
  }
}
