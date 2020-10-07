import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'card_image.dart';
//EL CARRUCEL DE IMAGENES NO TIENE ACCION EN
//PARTICULAR CON EL USUARIO, LO PUEDES
//DESILZAR PERO NO HAY ACCION Q AFECTE
//A OTRA RAMA

// ignore: must_be_immutable
class CardImageList extends StatefulWidget {

  User user;
  // ignore: invalid_required_positional_param
  CardImageList(@required this.user);
  @override
  State<StatefulWidget> createState() {
    return _CardImageList();
  }
}

UserBloc userBloc;

class _CardImageList extends State<CardImageList> {
  
  
  
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
          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              print("PLACESLIST: WAITING");
              return CircularProgressIndicator();
            case ConnectionState.none:
                  print("PLACESLIST: NONE");
              return CircularProgressIndicator();
            case ConnectionState.done: // aca se muestra la lista
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents, widget.user)); // llamando desde nuestro BLoC
            case ConnectionState.active:
              print("PLACESLIST: ACTIVE");
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents/*aca está la lista que se detecta*/, widget.user));
            default:
              return listViewPlaces(userBloc.buildPlaces(snapshot.data.documents, widget.user));
          } // switch
        }// builder
      ),
      
      /**/
    );
  }

  // renderizando el CardImageFABIcon
  Widget listViewPlaces(List<Place> places) {

    void setLiked(Place place){ // recibe el place clickeado y modifica su estado
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;

    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        //ACA PONIENDO TODOS LOS ELEMENTOS 
        //DE LA LISTA
        children: places.map((place){
          return CardImageWithFABIcon(
            pathImage: place.urlImage,
            width: 300.0,
            height: 250.0,
            left: 20.0,
            onPressedFABIcon: (){
              setLiked(place);
            },
            iconData: place.liked?iconDataLiked:iconDataLike,
            internet: true,
          );
        }).toList(),// aca se llamará BuildPlaces

    );
  }
}