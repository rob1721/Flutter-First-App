import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'profile_place_info.dart';
// ignore: unused_import
import 'profile_place.dart';

// ignore: must_be_immutable
class ProfilePlace extends StatelessWidget {

  Place place;
  bool internet = true;

  ProfilePlace(@required this.place);

  @override
  Widget build(BuildContext context) {

    final photoCard = Container(
      margin: EdgeInsets.only(
          top: 10.0,
          bottom: 70.0
      ),
      height: 220.0,
      decoration: BoxDecoration( // card de la imagen
          image: DecorationImage(
              fit: BoxFit.cover,
              image: internet?
                CachedNetworkImageProvider(place.urlImage):
                AssetImage(place.urlImage),//NetworkImage(place.urlImage), //mostrando imagen
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white70,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0)
            )
          ]
      ),
    );

    return Stack(
      alignment: Alignment(0.0, 0.8),
      children: <Widget>[
        photoCard,
        ProfilePlaceInfo(place)
      ],
    );
  }

}