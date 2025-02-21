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
                AttributesWidget()
              ],
            ));
            } else if (state is WeatherFailure) {
              return Center(
                child: Text('Error: ${state.errorMessage}'),
              );
            }
            return SizedBox();
      }
        ),
      ),
    );
  }
}