import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/weather_cubit/cubit.dart';
import '../manager/weather_cubit/states.dart';


class PredictWidget extends StatelessWidget {
  const PredictWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WeatherCubit>(context);
    return BlocBuilder<WeatherCubit, WeatherState>(

      builder: (context,state) {
        if (state is PredictionLoading)
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is PredictionSuccess)
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: ()
                {
                  cubit.getPrediction();
                },
                child: const Text('Get Prediction'),
              ),
            ],
          );
        }
        else if (state is PredictionFailure)
        {
          return Text('Error: ${state.errorMessage}');
        }
        else
        {
          return const Text('No prediction available.');
        }
      }
    );
  }
}