import 'package:firebase_auth/firebase_auth.dart';

final class FirebaseAuthService {
  FirebaseAuthService._();

  final _authInstance = FirebaseAuth.instance;

  static final FirebaseAuthService instance = FirebaseAuthService._();

  /// this function will return user's uId if account exist if its not then it will return null
  Future<String?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
        await _authInstance.signInWithEmailAndPassword(email: email, password: password);
          if (_authInstance.currentUser != null) {
            return _authInstance.currentUser!.uid;
          }
    return null;
    } catch (e) {
      return null;
    }
  }

}