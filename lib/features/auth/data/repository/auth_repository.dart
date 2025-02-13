
import '../../domain/entities/auth_user.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);
  Future<AuthUser?> signUpWithEmailAndPasswordAndInfo({
    required String email,
    required String password,
    required String name,
    required String phone,
    required int age,
  });
}