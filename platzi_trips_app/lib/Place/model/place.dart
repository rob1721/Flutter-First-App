import 'package:flutter/material.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  bool liked;
  //User userOwner; quitado pq ya no se comporta como tipo user, sino como referencia

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    this.likes,
    this.id,
    //this.userOwner,
  });
}