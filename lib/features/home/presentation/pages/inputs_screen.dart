import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../db_injection.dart';
import '../manager/weather_cubit/cubit.dart';
import '../manager/weather_cubit/states.dart';
import 'home_screen.dart';


class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:   (context,) => WeatherCubit(sl()) ,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Taqss - Input'),
          centerTitle: true,
        ),
        body: BlocBuilder<WeatherCubit,WeatherState>(
          builder: (context,state)
          {
            var cubit = context.read<WeatherCubit>();
            return  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: cubit.locationController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Location',
                      prefixIcon: Icon(Icons.location_city),

                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cubit.daysController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter Number of Days',
                      prefixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (cubit.locationController.text.isNotEmpty &&
                          cubit.daysController.text.isNotEmpty) {
                        context.read<WeatherCubit>().fetchWeather(
                          cubit.locationController.text,
                          int.parse(cubit.daysController.text),
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  HomeScreen(),
                            ),
                              (route) => false,
                        );
                      } else if (cubit.locationController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter location'),
                        ));
                      } else if (cubit.daysController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter days'),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter location and days')));
                      }
                    },
                    child: const Text('Get Weather'),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}