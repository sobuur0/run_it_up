import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> signUp({
    required String email,
    required String password,
    required String username,
    required String fullName,
  }) async {
    try {
      await _auth.setSettings(appVerificationDisabledForTesting: true);

      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String? token = await userCredential.user?.getIdToken();

      if (token != null) {
        await _storage.write(key: 'jwt_token', value: token);

        await userCredential.user?.updateDisplayName(username);

        return token;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String? token = await userCredential.user?.getIdToken();

      if (token != null) {
        await _storage.write(key: 'jwt_token', value: token);
        return token;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _storage.delete(key: 'jwt_token');
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: 'jwt_token');
    return token != null;
  }

  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'Email is already registered';
      case 'invalid-email':
        return 'Invalid email address';
      case 'operation-not-allowed':
        return 'Operation not allowed';
      case 'weak-password':
        return 'Password is too weak';
      case 'user-disabled':
        return 'User has been disabled';
      case 'user-not-found':
        return 'User not found';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return 'An error occurred';
    }
  }
}
