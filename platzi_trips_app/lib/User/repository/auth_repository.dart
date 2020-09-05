// este es el repositorio q contiene la logica de repository
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/User/repository/firebase_auth_api.dart';
// este es como el module
class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  //implementado la capa de datos para firebase_auth_api
  Future<auth.User> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();
  
}