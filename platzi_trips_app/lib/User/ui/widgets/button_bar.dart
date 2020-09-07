// ahora mas genéricos
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/ui/widgets/camera.dart';
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
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
              () /*async*/ {
                /*var _image = await ImagePicker().getImage(source: ImageSource.camera);

                //File lilo = File.fromRawPath(await _image.readAsBytes());

                File asd = File(_image.path);
                File asd2 = File.fromRawPath(await _image.readAsBytes());

                // casteando de PickedFile a File
                //_image: DecorationImage(image: FileImage(File(_image.path)));
                // OBTENIENDO LA IMAGEN
                //ImagePicker imagePicker;
                /*CUAL ES LA FUENTE Q QUEREMOS MOSTRAR */
                if (_image != null){
                  Navigator.push(context,
                    MaterialPageRoute(builder:
                      (BuildContext context) => AddPlaceScreen(image: _image),
                    ),
                  ); //push
                } //if*/
                // ignore: deprecated_member_use
                ImagePicker.pickImage(source: ImageSource.camera)
                    .then((File image) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image)));
                }).catchError((onError) => print(onError));

                  
                    
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