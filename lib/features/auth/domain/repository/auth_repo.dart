import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import '../../data/models/user_model.dart';
import '../../data/repository/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository(
      {firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userModel = UserModel(
        uId: user.user!.uid,
        email: user.user!.email!,
        name: user.user!.displayName!,
        phone: user.user!.phoneNumber!,
        age: user.user!.photoURL!,
      );
      return userModel;
    } on firebase_auth.FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );  
      
      
    } on firebase_auth.FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .set(userModel.toMap());
  }
}
