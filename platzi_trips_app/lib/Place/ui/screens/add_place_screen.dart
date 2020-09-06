// la pantalla de añadir un lugar
// recibe la foto y la muestra
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';

import 'package:platzi_trips_app/widgets/gradient_background.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
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
    // usando la variable controller para capturar datos del input (uno para cada input q se use)
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    // evitando el desborde de texto
    screenWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBackground(height: 300.0,),
          Row( // flecha para atras + titulo
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
                    padding: EdgeInsets.only(
                      top: 45.0,
                      left: 20.0,
                      right: 10.0
                    ),
                    child: TitleHeader(title: "Add a new Place"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 120.0,
              bottom: 20.0,
            ),
            child: ListView(
              children: <Widget>[
                Container(/*FOTO!*/
                  alignment: Alignment.center,
                  child: CardImageWithFABIcon(
                    pathImage: "assets/img/s.jpg",// widget.image.path,
                    width: 350.0,
                    height: 250.0,
                    //onPressedFABIcon: null,
                    iconData: Icons.camera_enhance,
                  ),
                ),
                Container(/*TextField Title*/
                  margin: EdgeInsets.only(
                    bottom: 20.0,  
                  ),
                  // el form:
                  child: TextInput( // en container para poner con margin
                    hintText: "Title", // TITLE
                    inputType: null, // para q tenga el q está por defecto
                    maxLines: 1,
                    controller: _controllerTitlePlace, // capturara los datos del TextInput en el q está
                  ),
                ),
                // al no necesitar margin, se pone aparte
                TextInput( // DESCRIPTION
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  maxLines: 4, // DA ALTURA IGUAL
                  controller: _controllerDescriptionPlace,
                ),
                Container( // location en container por el 
                  margin: EdgeInsets.only(
                    top: 20.0,  
                  ),
                  child: TextInputLocation( // ADD GPS LOCATION
                    hintText: "Add Location",
                    iconData: Icons.location_on,
                    controller: null // HASTA AHORA NO LO PONEN
                    ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
  
}