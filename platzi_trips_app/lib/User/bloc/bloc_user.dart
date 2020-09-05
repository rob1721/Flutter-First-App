//autenticarse, escribir un lugar, dar me gusta, etc...
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart'as auth;
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  // _auth_repository es la autentificacion q se hizo
  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();

  // Flujo de datos STREAMS (en este caso proviene de firebase)
  // Stream - Firebase
  // StreamController
  // tipo de dato esperado:
  Stream<auth.User> streamFirebase = auth.FirebaseAuth.instance.authStateChanges();
  // metodo q devuelve el objeto q acabo de crear
  Stream<auth.User> get authStatus => streamFirebase;

  // contendra todos los casos de uso de la app (o al menos del user):
    // caso 1.- hacer SignIn a la app google
  Future<auth.User> signIn() async {
    return await _auth_repository.signInFirebase();
  }
  }
    // caso 2.- 

  @override
  // ignore: unused_element
  void dispose() {

  }
}