import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/weather_cubit/cubit.dart';
import '../manager/weather_cubit/states.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context,state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          final forecastDays = state.weatherEntity.forecast?.forecastday??[];
          final selectedDayIndex = cubit.selectedDayIndex;
          final selectedDay = forecastDays[selectedDayIndex];
          return Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration
                  (
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text('Temperature :', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),),
                    const SizedBox(height: 8.0,),
                     Text('${selectedDay.day?.avgtempC} C', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration
                  (
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text('Max Temperature :', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),),
                    const SizedBox(height: 8.0,),
                    Text('${selectedDay.day?.maxtempC} C', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration
                  (
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text('Max Wind Speed:', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),),
                    const SizedBox(height: 8.0,),
                    Text("${selectedDay.day?.maxwindKph} KPH", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration
                  (
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text('Chance Of Rain :', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0),),
                    const SizedBox(height: 8.0,),
                     Text('${selectedDay.day?.dailyChanceOfRain} ', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(height: 16,),
            ],
          );
        }
        return SizedBox();
      });
  }
}
