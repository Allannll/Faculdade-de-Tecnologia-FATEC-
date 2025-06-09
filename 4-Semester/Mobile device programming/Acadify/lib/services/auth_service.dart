import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> registerUser({
    required String email, 
    required String name, 
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
        print('Erro ao registrar: ${e.message}');
      rethrow;
    }
  }
}
