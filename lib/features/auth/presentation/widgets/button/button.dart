import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final String title;
  const DefaultButton({Key? key, required this.onPressed, required this.title}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: ElevatedButton(
          onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
        child: Text(title,style: const TextStyle
          (
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold) ,),
      ),
    );
  }
}
