// HACIENDO ESTE BOTON DE LA FORMA MAS GENERICA POSIBLE
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonGreen extends StatefulWidget {
  // final pq es requerido mas q nada..
  final String text; //const
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed; //cuando se define esta variable, implica q puede recibir una funcion como parametro

  // key hacemos que los datos que estamos pasando como paramentros, lleven una key (nombre) como clave
  // hace tener que cuando se use el boton, se muestren los key
  ButtonGreen({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.height,
    this.width
  });

  @override
  State<StatefulWidget> createState() {
    return _ButtonGreen();
  }
  
}

class _ButtonGreen extends State<ButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        //POSICION
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0,

        ),
        width: widget.width,
        height: widget.height,
        //DECORACIONES/COLORES
        decoration: BoxDecoration(
          //borde circular
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFa7ff84),//arriba izq
              Color(0XFF1cbb78), //color original medio morado
              //Color(0X00A321), //abajo der
              //puedes agregar + de 2 colores
            ],
            begin: FractionalOffset(0.2, 0.4),
            end: FractionalOffset(0.4, 3.5),
            stops: [0.0, 0.6],
            tileMode: TileMode.clamp,
          )
        ),
        //TEXTO
        child: Center(
          child: Text(
            widget.text,
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