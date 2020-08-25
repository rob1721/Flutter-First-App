import 'package:flutter/material.dart';
import 'floating_action_button_green.dart';

// ignore: must_be_immutable
class CardImage extends StatelessWidget {

  String pathImage = "assets/img/a.jpg";

  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(
        top: 80.0,
        left: 20.0
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          //ajustando la imagen y q no se corte
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
        //AGREGANDO REDONDEO A LOS BORDES
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //DANDO FORMA RECTANGULAR
        shape: BoxShape.rectangle,
        //SOMBRA DEBAJO DE LA IMAGEN
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(),
      ],
    );
  }
}