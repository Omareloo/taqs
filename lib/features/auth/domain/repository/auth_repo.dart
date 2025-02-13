import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import '../../data/models/user_model.dart';
import '../../data/repository/auth_repository.dart';
import '../entities/auth_user.dart';


class FirebaseAuthRepository implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  FirebaseAuthRepository(
      {firebase_auth.FirebaseAuth? firebaseAuth,
        FirebaseFirestore? firestore})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;


  @override
  Future<AuthUser?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('User signed in: ${userCredential.user?.uid}');
      return _firebaseUserToAuthUser(userCredential.user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: $e');
      return null;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
  Future<void> _saveUserData(UserModel userModel) async {
    try {
      if (userModel.uid.isEmpty) {
        debugPrint('Error: userModel.uid is empty!');
        throw Exception('userModel.uid is empty!');
      }
      final userMap = userModel.toMap();
      debugPrint('User Map: $userMap');
      await _firestore
          .collection('users')
          .doc(userModel.uid)
          .set(userMap);
    } catch (e) {
      debugPrint('Error saving user data to Firestore: $e');
      rethrow; // Re-throw the exception to be caught in signUpWithEmailAndPasswordAndInfo
    }
  }

  AuthUser _firebaseUserToAuthUser(firebase_auth.User? firebaseUser,
      {UserModel? userModel}) {
    return AuthUser(
      id: firebaseUser!.uid,
      userModel: userModel,
    );
  }

  @override
  Future<AuthUser?> signUpWithEmailAndPasswordAndInfo({
    required String email,
    required String password,
    required String name,
    required String phone,
    required int age,
  }) async {
    try {
      final userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        UserModel userModel = UserModel(
          uid: userCredential.user!.uid,
          name: name,
          email: email,
          phone: phone,
          age: age,
        );
        await _saveUserData(userModel);
        return _firebaseUserToAuthUser(userCredential.user, userModel: userModel);
      } else {
        return null;
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException: $e');
      return null;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }
}