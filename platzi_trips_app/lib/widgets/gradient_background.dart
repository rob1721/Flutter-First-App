import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GradientBackground extends StatelessWidget {
  String title = "Popular";
  // definiendo la altura del background
  double height = 0.0;

  // constructor
  
  GradientBackground({
    Key key,
    this.height
  });

  @override
  Widget build(BuildContext context) {

    // altura de cualquier celular!!!
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    // flag para height = null -> full screen
    if (height == null) {
      height = screenHeight;
    }

    return Container(
      width: screenWidht,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // desde el tono mas arriba hasta el mas abajo
            Color(0xFF4268D3),
            Color(0XFF584CD1), //color original medio morado
            //Color(0X00A321), //tono personal, medio verde agua
          ],
          // juega con los numeros
          begin: FractionalOffset(0.2, 0.4), //custom
          //end: FractionalOffset(0.4, 3.5),
          //begin: FractionalOffset(0.2, 0.0), //original
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6], // orientacion del gradiente
          tileMode: TileMode.clamp, // color de relleno si pasa algo con el gradiente..
        )
      ),

      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width: screenWidht,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(screenHeight / 2),
          ),
        )
      )
      /*Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontFamily: "Lato",
          fontWeight: FontWeight.bold
        ),
      ),*/
      //alineacion del texto
      //alignment: Alignment(-0.9, -0.6),
    );
  }
}