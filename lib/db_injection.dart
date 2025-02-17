import 'package:get_it/get_it.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/home/data/repository/app_repository.dart';
import 'features/home/domain/repository/app_repo.dart';

final sl = GetIt.instance;

class DpInjection {
  static  init() async{
    _authRepoInit();
    _weatherRepoInit();
  }
  static _authRepoInit() {
    sl.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());
  }
  static _weatherRepoInit() {
    sl.registerLazySingleton<WeatherRepository>(() => ImplWeatherRepository());
  }

}
