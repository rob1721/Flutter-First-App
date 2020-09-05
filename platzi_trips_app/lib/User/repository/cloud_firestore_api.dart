import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class CloudFirestoreAPI {
  // variables en mayuscula, son constantes
  // ignore: non_constant_identifier_names
  final String USERS = "users";
  // ignore: non_constant_identifier_names
  final String PLACE = "place";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  
  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid); //obteniendo el identificador
    return ref.set({
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
}