import 'package:firebase_auth/firebase_auth.dart';
import 'package:netgrow/Widgets/alert_Dialog.dart';

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
    }catch (e){
      showAlertDialog(e.toString());
    }
  }
}
