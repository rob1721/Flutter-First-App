// la pantalla de añadir un lugar
// recibe la foto y la muestra
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';

import 'package:platzi_trips_app/widgets/gradient_background.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget {
  // file a subir
  File image; // hacer aca el cambio q se muestra en net
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

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    // usando la variable controller para capturar datos del input (uno para cada input q se use)
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    
    // evitando el desborde de texto
    //screenWidht = MediaQuery.of(context).size.width;
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
                  //width: screenWidht,
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
                  // ignore: missing_required_param
                  child: CardImageWithFABIcon(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_enhance,
                    width: 350.0,
                    height: 250.0,
                    left: 0,
                    //onPressedFABIcon: null,
                  ),
                ),
                Container(/*TextField Title*/
                  margin: EdgeInsets.only(
                    top: 20.0,
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
                    //controller: null // HASTA AHORA NO LO PONEN
                    controller: null,
                    ),
                ),
                // boton
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: () {
                      
                      // debemos tener la ID del usuario logueado actualmente
                      userBloc.currentUser.then((auth.User user) {
                        if (user != null) {
                          String uid = user.uid;
                          // path compuesto de id de user + nombre archivo (date)
                          String path = "$uid/${DateTime.now().toString()}.jpg"; // fijarse en la extension jpg
                          // 1) la imagen a firebase storage
                          // devolvera una url de la imagen
                          // devolviendo la imagen desde el 
                          userBloc.uploadFile(path, widget.image)
                            .then((StorageUploadTask storagUploadTask) {// then devuelve la imagen subida
                              storagUploadTask.onComplete
                              .then((StorageTaskSnapshot snapshot) {// se obtienen los datos de la imagen
                                snapshot.ref.getDownloadURL()
                                .then((urlImage) {// se obtiene el urlImage
                                  print("URLIMAGE: $urlImage"); // LO Q ESTAMOS OBTENIENDO

                                  // 2) con cloud firestore
                                  // incertamos el place (title, description, imgurl, userOwner, likes)
                                  userBloc.updatePlaceData(
                                    Place(
                                      name: _controllerTitlePlace.text,
                                      description: _controllerDescriptionPlace.text,
                                      urlImage: urlImage.toString(), // LO Q ESTAMOS PASANDO
                                      likes: 0,
                                    )
                                  ).whenComplete(() {
                                    print("Terminó");
                                    Navigator.pop(context);
                                  }); // whenComplete

                                });
                              });
                            });
                        }
                      });
                      
                    }, // onPressed
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