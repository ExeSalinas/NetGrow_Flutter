import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netgrow/Widgets/alert_Dialog.dart';
import 'package:netgrow/Widgets/info_Dialog.dart';

// servicio de autenticacion de firebase
// implementa el patron singleton.

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Singleton
  AuthService._singleton();
  static final AuthService _service = AuthService._singleton();
  factory AuthService() => _service;

  static AuthService get instance => _service;
  //Cambio de estado del user
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

//Usuario actual o null si no hay un usuario loggeado
  User? get currentUser => _firebaseAuth.currentUser;

  Future<User?> createUser(
      {required String email, required String password}) async {
    try {
      final userCredentials = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredentials.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
        showAlertDialog("La contraseña es demasiado corta");
      else {
        if (e.code == 'email-already-in-use')
          showAlertDialog('Ya existe una cuenta con ese Email.');
        else {
          // expr1 ?? expr2
          // If expr1 is non-null, returns its value;
          // otherwise, evaluates and returns the value of expr2.
          showAlertDialog(e.message ?? 'Error al Registrar');
        }
      }
    } catch (e) {
      showAlertDialog(e.toString());
    }
  }

  Future<User?> signInEmail(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlertDialog('No existe un usuario registrado para ese email');
      } else if (e.code == 'wrong-password') {
        showAlertDialog('Contraseña incorrecta');
      } else {
        showAlertDialog(e.message ?? 'Error al loggear');
      }
    } catch (e) {
      showAlertDialog(e.toString());
    }
  }

  Future<void> forgotPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      showInfoDialog("Se ha enviado el mensaje para recuperar la contraseña", title: "Mensaje Enviado");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlertDialog("Usuario no encontrado");
      }
    } catch (e) {
      showAlertDialog(e.toString());
    }
  }

  Future<void> updatePassword(
      {required String newPassword, required String code}) async {
    try {
      _firebaseAuth.confirmPasswordReset(code: code, newPassword: newPassword);
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'expired-action-code') showAlertDialog("Código expirado");
      if (e.code == 'invalid-action-code') showAlertDialog("Código expirado");
      if (e.code == 'weak-password')
        showAlertDialog("La nueva contraseña es muy corta");
    } catch (e) {
      showAlertDialog(e.toString());
    }
  }

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }
}
