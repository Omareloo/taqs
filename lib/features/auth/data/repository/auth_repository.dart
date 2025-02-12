import 'package:taqs/features/auth/data/models/user_model.dart';


abstract class AuthRepository {
  Future<UserModel?> signInWithEmailAndPassword(String email, String password);
  Future<UserModel?> createUserWithEmailAndPassword(String email, String password);
  Future<void> saveUser(UserModel userModel);
}