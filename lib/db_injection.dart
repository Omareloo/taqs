import 'package:get_it/get_it.dart';
import 'config/network/dio.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/home/data/repository/app_repository.dart';
import 'features/home/domain/repository/app_repo.dart';
import 'features/home/domain/use_case/get_weather_usecase.dart';

final sl = GetIt.instance;

class DpInjection {
  static  init() async{
    _authRepoInit();
    _weatherRepoInit();
    _weatherUseCaseInit();
    _dioInit();
  }

  static _dioInit() => sl.registerLazySingleton<DioHelper>(() => DioHelper());

  static _authRepoInit() {
    sl.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());
  }
  static _weatherRepoInit() {
    sl.registerLazySingleton<WeatherRepository>(() => ImplWeatherRepository());
  }
  static _weatherUseCaseInit() {
    sl.registerLazySingleton<GetWeatherUseCase>(() => GetWeatherUseCase(sl()));
  }

  static close() {
    sl.reset();
  }

}
