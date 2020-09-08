// lista de lugares
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'profile_header.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_places_list.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context); //inicializando..



    return StreamBuilder(
      stream: userBloc.authStatus, // por si ha cambiado el user
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();

          case ConnectionState.done:
            return showProfileData(snapshot);
          case ConnectionState.active:
            return showProfileData(snapshot);
          default:
        }
      }, //succionando los datos..
    );
    
    /*Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(), // para obtener user datos
            ProfilePlacesList() // para obtener User id

          ],
        ),
      ],
    );*/
  }

  // haciendo un metodo que regrese el stack
  Widget showProfileData(AsyncSnapshot snapshot) {
    if(!snapshot.hasData || snapshot.hasError) {
      print('NO LOGUEADO');
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              Text("Usuario no logueado, Haz login!"),
            ],
          ),
        ],
      );
    } else {
      print("Logueado!!");
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoUrl,
      );
      return Stack(
        children: <Widget>[
          ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user), // para obtener user datos
              ProfilePlacesList(user) // para obtener User id

            ],
          ),
        ],
      );
    }
  }
}