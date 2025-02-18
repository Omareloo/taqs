import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/cubit.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';
import 'package:taqs/features/home/presentation/widgets/attributes_widget.dart';
import 'package:taqs/features/home/presentation/widgets/days_widget.dart';
import '../../../../db_injection.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController locationController = TextEditingController();



  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(sl()),
      child: Scaffold(
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
        body: BlocBuilder<WeatherCubit,WeatherState>(
          builder: (context,state)=> Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //create dropdown with list of cities

                DaysWidget(),
                Spacer(),
                AttributesWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}