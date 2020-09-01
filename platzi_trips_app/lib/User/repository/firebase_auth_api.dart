// este es el final del ciclo de la app
// este archivo obtendra todos los datos y logica con respecto a la aplicacion con respecto a la conexion con fireAuth
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance; // toda la autentificacion la trae en instance
  final GoogleSignIn googleSignIn = GoogleSignIn(); // toda la instancia/lo q tenga q ver con google

  Future<auth.User> signIn() async {
    // primera autentificacion con Google
    // ventana de cuenta a registrar
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    // guardando las credenciales
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    // segunda autentificacion con Firebase
    auth.UserCredential userCredential = await _auth.signInWithCredential(
      auth.GoogleAuthProvider.credential(
        idToken: gSA.idToken, accessToken: gSA.accessToken,
      ),
    );

    return userCredential.user;
  }

}