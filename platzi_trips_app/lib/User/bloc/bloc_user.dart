//autenticarse, escribir un lugar, dar me gusta, etc...
// ignore: unused_import
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'as auth;
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repository.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  // _auth_repository es la autentificacion q se hizo
  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();
  auth.User current;

  // Flujo de datos STREAMS (en este caso proviene de firebase)
  // Stream - Firebase
  // StreamController
  // tipo de dato esperado:
  Stream<auth.User> streamFirebase = auth.FirebaseAuth.instance.authStateChanges();
  // metodo q devuelve el objeto q acabo de crear
  Stream<auth.User> get authStatus => streamFirebase;
  // adquiriendo el currenUser
  Future<auth.User> get currentUser => Future.value(auth.FirebaseAuth.instance.currentUser);
  
  // contendra todos los casos de uso de la app (o al menos del user):
    // caso 1.- hacer SignIn a la app google
  Future<auth.User> signIn() {
    // adquiriendo el currenUser
    return _auth_repository.signInFirebase();
  } 

    // caso 2.- registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots(); //traeme una foto de todo lo q exista en la instancia de la base de datos cuya coleccion corresponda a places y escucha
  // ahora poniendo otro stream para acceder al anterior
  Stream<QuerySnapshot> get placesStream => placesListStream;
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot);
  
  Stream<QuerySnapshot> myPlacesListStream(String uid) =>
    FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES)
    .where("userOwner", isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().USERS}/$uid"))
    .snapshots(); //se comportara como un metodo esperando recibir el id del user //where para comparar si este userOwner es igual al id del usuario
    // linea 51-54 me convierte la cadena en un stream 

  // subiendo la imagen a firestore
  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) => _firebaseStorageRepository.uploadFile(path, image);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  // ignore: unused_element
  void dispose() {

  }
}