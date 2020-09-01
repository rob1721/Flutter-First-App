import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:platzi_trips_app/widgets/gradient_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

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
    return signInGoogleUI();
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
                  //definiendo su comportamiento aca..
                  userBloc.signIn().then((auth.User user) => print("El usuario es: ${user.displayName}"));
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