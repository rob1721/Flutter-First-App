import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';

import 'package:platzi_trips_app/widgets/gradient_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
// ignore: unused_import
import 'package:platzi_trips_app/platzi_trips.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
  
}

class _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc; // se necesita instanciar..
   

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);// instanciando userBloc
    return _handleCurrentSession();
  }

  // devuvle el estado de la sesion
  Widget _handleCurrentSession() {
    // aca defino si es q abro el signInGoogle (en caso de registrar) o el listado (ya registrado o iniciado sesion anteriormente)
    return StreamBuilder(
      // definiendo si el userBloc está autentificado o no
      stream: userBloc.authStatus,
      builder: (
        BuildContext context, AsyncSnapshot<dynamic> snapshot
        ) {
          //snapshot contiene nuestra data (el objeto user, traido de firebase)
          if (!snapshot.hasData || snapshot.hasError) {
            // snapshot está vacio (no hay user)
            return signInGoogleUI();
          }
          // ojo con esto..puede no ser cupertino
          return PlatziTripsCupertino();
        },
    );
  }


  //manejo de la sesion del usuario
  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBackground("", null), //altura null = FULLSCREEN
          Column(
            //centrando posicion alineando
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome \n This is your Travel App",
                style: TextStyle(
                  fontSize: 37.0,
                  fontFamily: "Lato",
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
              ButtonGreen(text: "Login with Gmail",
                onPressed: () {
                  //no obtenidno correctamente los datos
                  userBloc.signOut();
                  //definiendo su comportamiento aca..
                  userBloc.signIn().then(
                    (auth.User user) {
                      print("El usuario es: ${user.displayName}");
                      userBloc.updateUserData(
                        User(
                          uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoURL,
                        )
                      );
                    },
                  );
                },
                width: 300.0,
                height: 50.0,
              )
            ]
          )
        ],
      )
    );
  }
  
}