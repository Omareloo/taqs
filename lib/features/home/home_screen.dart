import 'package:flutter/material.dart';
import 'package:taqs/config/style/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Taqss is in your service',style: AppTextStyle.font24black700)),
    );
  }
}
