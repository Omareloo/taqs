import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taqs/config/style/app_theme.dart';
import 'package:taqs/onBoarding.dart';
import 'db_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DpInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: OnBoardingScreen(),
    );
  }
}
