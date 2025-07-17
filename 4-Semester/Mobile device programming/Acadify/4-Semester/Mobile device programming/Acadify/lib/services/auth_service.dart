import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        log('Erro ao registrar: ${e.message}');
      return false;
    }
  }

  Future<bool> updateUser({
    required String email,
    required String name,
    required String lastName,
  }) async {
    try {
      User? user = _firebaseAuth.currentUser;

      if (user == null) {
        log('Usuário não está logado.');
        return false;
      }

      await user.verifyBeforeUpdateEmail(email);

      await _firestore.collection('usuarios').doc(user.uid).update({
        'name': name,
        'last name': lastName,
        'email': email,
        'date': FieldValue.serverTimestamp(),
      });

      log('Usuário atualizado com sucesso.');
      return true;
    } on FirebaseAuthException catch (e) {
      log('Erro ao atualizar o usuário: ${e.message}');
      return false;
    } catch (e) {
      log('Erro inesperado: $e');
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
      log('Erro ao logar: ${e.message}');
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
      log('Erro ao enviar o e-mail de recuperação. (${e.message})');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getCollectionData(String collectionName) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      final doc = await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(user.uid)
          .get();
      return doc.data();
    }
    on FirebaseAuthException catch (e) {
      log('Erro ao coletar os dados da coleção. (${e.message})');
      return null;
    }
  }

  Future<void> saveAppointment(DateTime data, String titulo, String descricao) async {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  if (uid == null) throw Exception('Usuário não autenticado');

  final dataFormatada = "${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}";

  await FirebaseFirestore.instance
      .collection('compromissos')
      .doc(uid)
      .collection('eventos')
      .add({
    'date': dataFormatada,
    'title': titulo,
    'description': descricao,
    'created_at': Timestamp.now(),
  });
}
}
