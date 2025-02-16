import 'package:bloc/bloc.dart';
import 'package:taqs/features/home/presentation/manager/weather_cubit/states.dart';

class WeatherCubit extends Cubit<WeatherStates>
{
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => context.read<WeatherCubit>();

  void getWeather()
  {
    emit(WeatherLoading());
    emit(WeatherGetSuccess());
    emit(WeatherGetError('something went wrong'));
  }

}
