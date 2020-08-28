import 'package:flutter/material.dart';
import 'card_image.dart';
//EL CARRUCEL DE IMAGENES NO TIENE ACCION EN
//PARTICULAR CON EL USUARIO, LO PUEDES
//DESILZAR PERO NO HAY ACCION Q AFECTE
//A OTRA RAMA

class CardImageList extends StatelessWidget {
  
  
  
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Container(
      height: 350.0, //definir esta altura permite
                //definir el espacio a ocupar
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        //ACA PONIENDO TODOS LOS ELEMENTOS 
        //DE LA LISTA
        children: <Widget>[
          CardImage("assets/img/a.jpg"),
          CardImage("assets/img/s.jpg"),
          CardImage("assets/img/d.jpg"),
          CardImage("assets/img/f.jpg"),
          CardImage("assets/img/g.jpg"),
          CardImage("assets/img/h.jpg"),
        ],

      )
    );
  }
  
}