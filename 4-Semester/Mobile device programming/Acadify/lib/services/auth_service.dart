import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> registerUser({
    required String email, 
    required String name, 
    required String lastName,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('usuarios').doc(userCredential.user!.uid).set({
        'name': name,
        'last name': lastName,
        'email': email,
        'uid': userCredential.user!.uid,  
        'date': FieldValue.serverTimestamp(),
      });
      return true;
    } on FirebaseAuthException catch (e) {
        print('Erro ao registrar: ${e.message}');
      return false;
    }
  }

  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      print('Erro ao logar: ${e.message}');
      rethrow;
    }
  }

  Future<void> passwordReset({
    required String email
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: email);
    } on FirebaseAuthException catch (e) {
      print('Erro ao enviar o e-mail de recuperação. (${e.message})');
      rethrow;
    }
  }
}
