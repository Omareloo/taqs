import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/domain/repository/auth_repo.dart';

final sl = GetIt.instance;

class DpInjection {
  static  init() async{

    ///Shared Preferences
   await _initSharedPref();

    ///Api Client

    ///Repositories
    _authRepoInit();
  }
static Future<void> _initSharedPref() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
}
 
  static void _apiClientInit() {
  sl.registerSingleton<Logger>(Logger());

  }


  static _authRepoInit() {
    sl.registerLazySingleton<AuthRepository>(() => FirebaseAuthRepository(sl(),sl()));
  }

}
