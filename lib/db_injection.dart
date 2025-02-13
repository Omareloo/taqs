import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/domain/repository/auth_repo.dart';

final sl = GetIt.instance;

class DpInjection {
  static  init() async{

    ///Shared Preferences

    ///Api Client

    ///Repositories
    _authRepoInit();
  }


 
  static void _apiClientInit() {
  sl.registerSingleton<Logger>(Logger());

  }


  static _authRepoInit() {
    sl.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository());
  }

}
