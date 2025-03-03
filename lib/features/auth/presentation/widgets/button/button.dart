import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taqs/config/style/text_styles.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final String title;
  const DefaultButton({super.key, required this.onPressed, required this.title});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: ElevatedButton(
          onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
        child: Text(title,style: AppTextStyle.font24white700,),
      ),
    );
  }
}
