import 'package:flutter/material.dart';

//no es el boton en si, si no..es el inkwell
//es el reconocer un sector como toucheable
// ignore: must_be_immutable
class ButtonPurple extends StatelessWidget {

  final String buttonText;
  final VoidCallback onPressed;

  ButtonPurple({
    Key key,
    @required this.buttonText,
    @required this.onPressed
  });
  //constructor

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //dando propiedades, en este caso, 
      //reaccionando al tap
      onTap: onPressed,
      //daremos la forma que queremos q tenga el
      //boton
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,

        ),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
          //borde circular
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFF4268D3), //arriba izq
              Color(0XFF584CD1), //color original medio morado
              //Color(0X00A321), //abajo der
              //puedes agregar + de 2 colores
            ],
            begin: FractionalOffset(0.2, 0.4),
            end: FractionalOffset(0.4, 3.5),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp,
          )
        ),
        //centrando el texto
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}