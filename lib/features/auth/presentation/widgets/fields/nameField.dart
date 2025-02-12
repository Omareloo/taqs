import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({
    super.key,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: nameController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name',
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Name Can\'t be Empty';
            }
            return null;
          },
        )
      ],
    );
  }
}
