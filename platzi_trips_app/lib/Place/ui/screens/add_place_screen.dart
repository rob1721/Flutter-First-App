// la pantalla de añadir un lugar
// recibe la foto y la muestra
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:platzi_trips_app/widgets/gradient_background.dart';

// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget {

  File image;
  // CONSTRUCTOR
  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
  
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackground(height: 300.0,),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                // este sizedbox es el area clickeable
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white, size: 45,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ), 
                ),
              ),
            ]
          ),
        ]
      ),
    );
  }
  
}