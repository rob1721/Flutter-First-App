// usada para logica de negocio
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';

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
        'urlImage' : place.urlImage,
        // tipo de dato User 
        // ignore: unnecessary_brace_in_string_interps
        'userOwner' : _db.doc("${USERS}/${user.uid}"),//"${USERS}/${user.uid}", // reference..
      }).then((DocumentReference dr) => dr.get() // obteniendo la referencia del doc
          .then((DocumentSnapshot snapshot) {
            snapshot.id;
            DocumentReference refUsers = _db.collection(USERS).doc(user.uid); //obtengo la data del id del usuario
            refUsers.update({
              'myPlaces' : FieldValue.arrayUnion([
                _db.doc("${PLACES}/${snapshot.id}"), // pusheando la referencia del user con sus places
              ]),
            });
          }),//then
        );//then 
             // obteniendo ID Place con referencia del array
  }

  // devolviendo la lista de places del user
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>(); //instanciada
    placesListSnapshot.forEach((p /*p de places*/) {
      profilePlaces.add(ProfilePlace(
        Place(
          name: p.data()['name'],
          description: p.data()['description'],
          urlImage: p.data()['urlImage'],
        ),
      ));
    });
    return profilePlaces;
  }
}