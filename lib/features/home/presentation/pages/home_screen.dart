import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/cubit.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';
import 'package:taqs/features/home/presentation/widgets/predict_widget.dart';
import 'package:taqs/features/home/presentation/widgets/attributes_widget.dart';
import 'package:taqs/features/home/presentation/widgets/days_widget.dart';
import '../../../../db_injection.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(sl(),sl(),sl()),
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
        body: BlocConsumer<WeatherCubit,WeatherState>(
          listener: (context,state)
          {
            if (state is WeatherFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ));
          }
            if (state is GeneratedListFailure)
            {
              ScaffoldMessenger.of(context).showSnackBar
                (
                SnackBar(
                  content: Text(state.errorMessage),
              )
              );
            }
            if (state is PredictionFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.errorMessage}')),
              );
            }
            },
          builder: (context,state){
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccess) {
            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DaysWidget(),
                Spacer(),
                PredictWidget(),
                Spacer(),
                AttributesWidget()
              ],
            ));
            }
            return SizedBox();
      }
        ),
      ),
    );
  }
}