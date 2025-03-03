import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/style/text_styles.dart';
import '../manager/weather_cubit/cubit.dart';
import '../manager/weather_cubit/states.dart';

class PredictWidget extends StatelessWidget {
  const PredictWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        List<int> prediction = [];
        if (state is WeatherSuccess) {
          prediction = state.prediction;
        }
        if (prediction == [0]) {
          return Text('It\'s not suitable to go out today!',style: AppTextStyle.font16black700,);
        } else {
          return Text('It\'s suitable to go out today!',style: AppTextStyle.font16black700,);
        }
      },
    );
  }
}