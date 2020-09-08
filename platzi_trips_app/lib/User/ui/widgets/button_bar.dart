// ahora mas genéricos
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

// ignore: must_be_immutable
class ButtonsBar extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[

            // cambiar la contraseña
            
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6),
            // ojo q el valor key q podría haber necesitado en el '()'
            () => {}),
            // añadiendo un nuevo lugar
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () async {
                ImagePicker picker = ImagePicker();
                PickedFile pickedFile = await picker.getImage(source: ImageSource.camera);
                File image = File(pickedFile.path);
                await Navigator.push( context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => AddPlaceScreen(image: image)
                  )
                );
              } //async
                // AÑADIENDO LUGAR PANTALLA
              
            ),
            // cerrar sesion
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 1),
            () => {
              userBloc.signOut(),
            }),
          ],
        )
    );
  }

}