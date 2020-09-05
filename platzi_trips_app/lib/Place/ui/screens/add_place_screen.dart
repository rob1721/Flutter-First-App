// la pantalla de añadir un lugar
// recibe la foto y la muestra
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:platzi_trips_app/widgets/gradient_background.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

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
  // evitando el desborde de texto
  double screenWidht;
  @override
  Widget build(BuildContext context) {
    // evitando el desborde de texto
    screenWidht = MediaQuery.of(context).size.width;
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
              // evitando el desborde de texto
              Flexible(
                child: Container(
                  // evitando el desborde de texto
                  width: screenWidht,
                  child: Container(
                    padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                    child: TitleHeader(title: "Add a new Place"),
                  ),
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
  
}