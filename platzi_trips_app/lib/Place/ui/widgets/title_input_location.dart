// "form/button" de gps location
import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {

  final String hintText; // texto flotante
  final TextEditingController controller; // trabajando formulario
  final IconData iconData;
  // no es necesario TextInputType pq se asume que el texto que estará aca...siempre sera leido como texto, ya que es una ubicacion de gps
  TextInputLocation({
    Key key,
    @required this.hintText,
    @required this.iconData,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),

        // decoracion del input
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: Icon(iconData),
          //suffix: , // lado derecho posicion del icono
          //prefix:  // lado izquierdo posicion del icono
          fillColor: Color(0xFFFFFFFF),
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder( // borde del form
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0)
            ),
            
          ),
          focusedBorder: OutlineInputBorder(
            // quitando el color negro del borde y poniendo el mismo q el fondo del form
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0)
            ),
          )
        ),
      ),

      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[// la sombra del widget
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0, // difuminado
            offset: Offset(0.0, 7.0) // posicion de la sombra
          ),
        ]
      ),
      
    );
  }
}