//autenticarse, escribir un lugar, dar me gusta, etc...
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart'as auth;

// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';

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
  Future<auth.User> signIn() => _auth_repository.signInFirebase();

    // caso 2.- registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  // ignore: unused_element
  void dispose() {

  }
}