import 'package:flutter/material.dart';




class AgeField extends StatefulWidget {
  final TextEditingController ageController;




  const AgeField({
    super.key,
    required this.ageController,
  });

  @override
  State<AgeField> createState() => _AgeFieldState();
}

class _AgeFieldState extends State<AgeField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Age', style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )),
        SizedBox(height: 8,),
        TextFormField(
          controller: widget.ageController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Age',
            prefixIcon: Icon(
              Icons.accessibility_new_sharp,
            ),
          ),
          validator: (value)
          {
            if(value!.isEmpty) {
              return 'Age Can\'t be Empty';
            }
            return null;
          },
        )
      ],
    );
  }
}
