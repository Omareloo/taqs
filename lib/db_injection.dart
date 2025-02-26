import 'package:get_it/get_it.dart';
import 'package:taqs/features/home/data/repository/genereate_list_repo.dart';
import 'package:taqs/features/home/data/repository/prediction_repository.dart';
import 'package:taqs/features/home/domain/repository/prediction_repo.dart';
import 'package:taqs/features/home/domain/use_case/generate_list.dart';
import 'package:taqs/features/home/domain/use_case/prediction_usecase.dart';
import 'config/network/dio.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/home/data/repository/app_repository.dart';
import 'features/home/domain/repository/app_repo.dart';
import 'features/home/domain/repository/generate_list_repo.dart';
import 'features/home/domain/use_case/get_weather_usecase.dart';

final sl = GetIt.instance;

class DpInjection {
  static  init() async{
    _authRepoInit();
    _weatherRepoInit();
    _weatherUseCaseInit();
    _predictionInit();
    _predictionUseCaseInit();
    _generateListonInit();
    _generateListUseCaseInit();
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
  static _predictionInit() {
    sl.registerLazySingleton<PredictionRepository>(() => ImplPredictionRepository());
  }
  static _predictionUseCaseInit() {
    sl.registerLazySingleton<GetPredictionUseCase>(() => GetPredictionUseCase(sl()));
  }
  static _generateListonInit() {
    sl.registerLazySingleton<GenerateListRepo>(() => ImplGenerateListRepository());
  }
  static _generateListUseCaseInit() {
    sl.registerLazySingleton<GenerateListUseCase>(() => GenerateListUseCase(sl()));
  }

  static close() {
    sl.reset();
  }

}
