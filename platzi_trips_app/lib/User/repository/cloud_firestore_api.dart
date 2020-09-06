import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class CloudFirestoreAPI {
  // variables en mayuscula, son constantes
  // ignore: non_constant_identifier_names
  final String USERS = "users";
  // ignore: non_constant_identifier_names
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // consultando el user logueado
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance; // toda la autentificacion la trae en instance
  
  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid); //obteniendo el identificador

    return await ref.set({
      // no es necesario poner key aca, pq proviene de atras (analizar cada modelo)
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),

    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    // accediendo a la data para subir un place
    CollectionReference refPlaces = _db.collection(PLACES);
    auth.User user = _auth.currentUser;
    // consultando el user logueado
    await 
      refPlaces.add({
        // definiendo los keys de la data (q es lo q queremos)
        'name' : place.name,
        'description' : place.description,
        'likes' : place.likes,
        // tipo de dato User 
        // ignore: unnecessary_brace_in_string_interps
        'userOwner' : "${USERS}/${user.uid}", // reference..
      });
    
  }
}