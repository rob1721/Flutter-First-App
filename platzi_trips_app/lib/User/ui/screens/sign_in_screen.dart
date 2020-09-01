import 'package:flutter/material.dart';

import 'package:platzi_trips_app/widgets/gradient_background.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
  
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
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