import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientBackground extends StatelessWidget {
  String title = "Popular";

  GradientBackground(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // desde el tono mas arriba hasta el mas abajo
            Color(0xFF4268D3),
            //Color(0XFF584CD1), color original medio morado
            Color(0X00A321),
          ],
          // juega con los numeros
          begin: FractionalOffset(0.2, 0.4),
          end: FractionalOffset(0.4, 3.5),
          //begin: FractionalOffset(0.2, 0.0),
          //end: FractionalOffset(0.8, 0.6),
          stops: [0.0, 0.6], // orientacion del gradiente
          tileMode: TileMode.clamp, // color de relleno si pasa algo con el gradiente..
        )
      ),

      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      ),
      //alineacion del texto
      alignment: Alignment(-0.9, -0.6),
    );
  }
}