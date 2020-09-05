// toda la informacion del usuario
import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/ui/widgets/user_info.dart';
import 'package:platzi_trips_app/User/ui/widgets/button_bar.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  UserBloc userBloc;
  User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    // alerta para cuando los datos sean depositados, se active y ejecute algo
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      // quier leer lo q está en el stream, y se recibe en snapshot
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // monitoreando el estado de la conexion
        switch (snapshot.connectionState) {
          // waiting
          case ConnectionState.waiting:
            // circulito de "loading"
            return CircularProgressIndicator();
          // none
          case ConnectionState.none:
            return CircularProgressIndicator();
          // active
          case ConnectionState.active:
            return ShowProfileData(snapshot); // debería mostrar todos los datos del usuario
          // done
          case ConnectionState.done:
            return ShowProfileData(snapshot);
        }
         //monitoreando el estado de la conexion
      },
    );

    /**/

  }
  // validando q tengo datos de snapshot
  // snapshot tiene datos (es como "un puntero")
  // ignore: non_constant_identifier_names
  Widget ShowProfileData(AsyncSnapshot snapshot) {
    // cuando no tiene datos
    if(!snapshot.hasData || snapshot.hasError) {
      print("No logueado");
      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
                CircularProgressIndicator(),
                Text("No se pudo cargar la información. Haz login"),
          ],
        ),
      );
    } else { // cuando se tiene datos
      print("Logueado");
      print(snapshot.data);
      // trayendo la data del snapshot a user
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoUrl);
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),
      );

    return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              title
            ],
          ),
          // trayendo los datos de la sesion
          UserInfo(user),
          ButtonsBar()
        ],
      ),
    );
    }
  }

}