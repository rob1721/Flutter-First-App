//autenticarse, escribir un lugar, dar me gusta, etc...
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart'as auth;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  // _auth_repository es la autentificacion q se hizo
  final _auth_repository = AuthRepository();

  // contendra todos los casos de uso de la app (o al menos del user):
    // caso 1.- hacer SignIn a la app google
  Future<auth.User> signIn() {
    return _auth_repository.signInFirebase();
  }
    // caso 2.- 

  @override
  // ignore: unused_element
  void dispose() {

  }
}