import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/cubit.dart';
import '../manager/weather_cubit/states.dart';

class DaysWidget extends StatefulWidget {
  const DaysWidget({super.key});

  @override
  State<DaysWidget> createState() => _DaysWidgetState();
}

class _DaysWidgetState extends State<DaysWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      final selectedDayIndex = cubit.selectedDayIndex;
      if (state is WeatherLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WeatherSuccess) {
        final forecastDays = state.weatherEntity.forecast?.forecastday??[];
        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecastDays.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedDayIndex;
              return GestureDetector(
                onTap: () {
                  cubit.setDayIndex(index);
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      Jiffy.parse(forecastDays[index].date??"").E,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        DateTime.tryParse(forecastDays[index].date??"")
                                ?.day
                                .toString() ??
                            "",
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
      return SizedBox();
    });
  }
}
