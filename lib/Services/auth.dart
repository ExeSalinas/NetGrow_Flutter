import 'package:firebase_auth/firebase_auth.dart';

// servicio de autenticacion de firebase
// implementa el patron singleton.

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Singleton
AuthService._singleton();
static final AuthService _service = AuthService._singleton();
factory AuthService() => _service;


static AuthService get instance => _service;
 //Cambio de estado del user
Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

//Usuario actual o null si no hay un usuario loggeado
User? get currentUser =>_firebaseAuth.currentUser;

}