
import '../../data/models/weather_model.dart';

class AuthUser {
  final String id;
  final UserModel? userModel;

  AuthUser({
    required this.id,
    this.userModel,
  });
}