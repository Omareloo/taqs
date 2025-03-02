import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqs/config/extentions/extention.dart';
import 'package:taqs/config/style/text_styles.dart';
import '../manager/weather_cubit/cubit.dart';
import '../manager/weather_cubit/states.dart';

class PredictWidget extends StatelessWidget {
  const PredictWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        int? prediction;
        if (state is PredictionSuccess) {
          prediction = state.prediction;
        }
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                WeatherCubit.get(context).getPrediction();
              },
              child: const Text('Get Prediction'),
            ),
            16.hs,
            if (state is PredictionLoading)
              const CircularProgressIndicator()
            else if (state is PredictionSuccess)
              Text(
                prediction == 0
                    ? 'Not to go out today'
                    : 'You can go out today',
                style: AppTextStyle.font18black700
              )
            else
              const SizedBox(),
          ],
        );
      },
    );
  }
}