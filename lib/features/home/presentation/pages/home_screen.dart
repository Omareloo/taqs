import 'package:flutter/material.dart';
import 'package:taqs/features/home/presentation/widgets/attributes_widget.dart';
import 'package:taqs/features/home/presentation/widgets/days_widget.dart';
import 'package:taqs/features/home/presentation/widgets/inside_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taqss',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DaysWidget(),
            SizedBox(height: 32,),
            InsideScreen(),
            Spacer(),
            AttributesWidget()
          ],
        ),
      ),
          );
  }
}