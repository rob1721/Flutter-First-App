import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

// ignore: must_be_immutable
class CardImageWithFABIcon extends StatelessWidget {

  final double height; // los datos requeridos deben estar en final
  final double width;
  final double left;
  final String pathImage;
  final VoidCallback onPressedFABIcon; // FAB FloatingActionButton
  final IconData iconData;

  CardImageWithFABIcon({
    Key key,
    @required this.pathImage,
    @required this.width,
    @required this.height,
    @required this.onPressedFABIcon,
    @required this.iconData,
    this.left
  });

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: left
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
        FloatingActionButtonGreen(iconData: iconData, onPressed: onPressedFABIcon,),
      ],
    );
  }
}