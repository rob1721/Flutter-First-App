import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'card_image.dart';
//EL CARRUCEL DE IMAGENES NO TIENE ACCION EN
//PARTICULAR CON EL USUARIO, LO PUEDES
//DESILZAR PERO NO HAY ACCION Q AFECTE
//A OTRA RAMA

// ignore: must_be_immutable
class CardImageList extends StatelessWidget {
  
  UserBloc userBloc;
  
  @override
  Widget build(BuildContext context) {
    // pasando todo el material a cloud_firestore_api para hacer la card_image lo mas generico posible
    userBloc = BlocProvider.of<UserBloc>(context);

    return Container(
      height: 350.0, //definir esta altura permite
                //definir el espacio a ocupar
      child: StreamBuilder(
        stream: userBloc.placesStream, //nos trae toda la lista de los lugares
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();

            case ConnectionState.done: // aca se muestra la lista
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents)); // llamando desde nuestro BLoC
            case ConnectionState.active:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents/*aca está la lista que se detecta*/));
            default:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents));
          } // switch
        }// builder
      ),
      
      /**/
    );
  }
  Widget listViewPlaces(List<CardImageWithFABIcon> placesCard) {
    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        //ACA PONIENDO TODOS LOS ELEMENTOS 
        //DE LA LISTA
        children: placesCard// aca se llamará BuildPlaces

    );
  }
}