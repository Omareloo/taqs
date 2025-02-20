import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taqs/config/extentions/extention.dart';
import 'package:taqs/config/style/app_color.dart';
import '../../../../config/style/text_styles.dart';
import '../manager/weather_cubit/cubit.dart';
import '../manager/weather_cubit/states.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<WeatherCubit>(context);
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        final selectedDayIndex = cubit.selectedDayIndex;
        if (state is WeatherSuccess) {
          final selectedDay = state.weatherModel.forecast!.forecastday![selectedDayIndex];
          return Column(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.lightGrey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temperature :',
                      style: AppTextStyle.font18black700,
                    ),
                    8.ws,
                    Text(
                      '${selectedDay.day!.avgtempC} C',
                     style: AppTextStyle.font18black700,
                    ),
                  ],
                ),
              ),
              16.hs,
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.lightGrey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Max Temperature :',
                     style: AppTextStyle.font18black700,
                    ),
                    8.ws,
                    Text(
                      '${selectedDay.day!.maxtempC} C',
                      style: AppTextStyle.font18black700,
                    ),
                  ],
                ),
              ),
              16.hs,
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.lightGrey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Max Wind Speed:',
                      style: AppTextStyle.font18black700,
                    ),
                    8.ws,
                    Text(
                      "${selectedDay.day!.maxwindKph} KPH",
                     style: AppTextStyle.font18black700,
                    ),
                  ],
                ),
              ),
              16.hs,
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.lightGrey,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chance Of Rain :',
                      style: AppTextStyle.font18black700,
                    ),
                    8.ws,
                    Text(
                      '${selectedDay.day!.dailyChanceOfRain} %',
                      style: AppTextStyle.font18black700,
                    ),
                  ],
                ),
              ),
              16.hs,
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}