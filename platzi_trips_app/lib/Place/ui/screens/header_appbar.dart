import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';

import 'package:platzi_trips_app/widgets/gradient_background.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image_list.dart';

// ignore: must_be_immutable
class HeaderAppBar extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    
    UserBloc userBloc;
    userBloc = BlocProvider.of(context);

    return StreamBuilder( // monitoreando el estado de la conexion
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator(),);

          case ConnectionState.active:
            return showPlacesData(snapshot);
          case ConnectionState.done:
            return showPlacesData(snapshot);
          default:
            return showPlacesData(snapshot);
        }

      }
    );
  }

  Widget showPlacesData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      return Stack(
        children: [
          GradientBackground(height: 250.0),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      User user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoUrl
      );

      return Stack(
        children: [
          GradientBackground(height: 250.0),
          CardImageList(user)
        ],
      );
    }
}
}