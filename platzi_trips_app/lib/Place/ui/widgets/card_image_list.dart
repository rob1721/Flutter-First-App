import 'package:flutter/material.dart';
import 'card_image.dart';
//EL CARRUCEL DE IMAGENES NO TIENE ACCION EN
//PARTICULAR CON EL USUARIO, LO PUEDES
//DESILZAR PERO NO HAY ACCION Q AFECTE
//A OTRA RAMA

class CardImageList extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    // pasando todo el material a cloud_firestore_api para hacer la card_image lo mas generico posible
    double width = 300.0;
    double height = 350.0;
    double left = 20.0;

    return Container(
      height: height, //definir esta altura permite
                //definir el espacio a ocupar
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        //ACA PONIENDO TODOS LOS ELEMENTOS 
        //DE LA LISTA
        children: <Widget>[
          CardImageWithFABIcon(
            pathImage: "assets/img/a.jpg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            left: left,
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/s.jpg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            left: left,
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/d.jpg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            left: left,
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/f.jpg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            left: left,
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/g.jpg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            left: left,
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/h.jpg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            left: left,
          ),
        ],

      )
    );
  }
  
}